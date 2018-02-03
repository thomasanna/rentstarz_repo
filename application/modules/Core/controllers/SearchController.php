<?php
/**
 * SocialEngine
 *
 * @category   Application_Core
 * @package    Core
 * @copyright  Copyright 2006-2010 Webligo Developments
 * @license    http://www.socialengine.com/license/
 * @version    $Id: SearchController.php 9906 2013-02-14 02:54:51Z shaun $
 * @author     John
 */

/**
 * @category   Application_Core
 * @package    Core
 * @copyright  Copyright 2006-2010 Webligo Developments
 * @license    http://www.socialengine.com/license/
 */
class Core_SearchController extends Core_Controller_Action_Standard
{
  public function indexAction()
  {
    $searchApi = Engine_Api::_()->getApi('search', 'core');

    // check public settings
    $require_check = Engine_Api::_()->getApi('settings', 'core')->core_general_search;
    if( !$require_check ) {
      if( !$this->_helper->requireUser()->isValid() ) return;
    }

    // Prepare form
    $this->view->form = $form = new Core_Form_Search();

    // Get available types
    $availableTypes = $searchApi->getAvailableTypes();
    unset($availableTypes[0]);
   
    if( is_array($availableTypes) && count($availableTypes) > 0 ) {
      $options = array();
      foreach( $availableTypes as $index => $type ) {
        $options[$type] = strtoupper('ITEM_TYPE_' . $type);
      }
      $form->type->addMultiOptions($options);
    } else {
      $form->removeElement('type');
    }

    // Check form validity?
    $values = array();
    if( $form->isValid($this->_getAllParams()) ) {
      $values = $form->getValues();
    }
    
    $this->view->query = $query = (string) @$values['query'];
    $this->view->type = $type = (string) @$values['type'];
    $this->view->page = $page = (int) $this->_getParam('page');

    if( $query ) {
      $this->view->paginator = $searchApi->getPaginator($query, $type);
      $itemCount	=	$this->view->paginator->getTotalItemCount();
      $this->view->paginator->setCurrentPageNumber($page);
      $viewer_id=Engine_Api::_()->user()->getViewer()->getIdentity(); 
      foreach($this->view->paginator as $item)
      {
		  $i	=	0;
		  $searchtype	=	$item->type;
		  $item = $this->view->item($item->type, $item->id);
		  
		  if($searchtype	==	'user')
		  {
			  
		   if($item->user_id != $viewer_id){
			   
			if($item->enabled	==	1)
			{
				$i	=	$i + 1;
			}
			$this->view->itemCount	=	$i;
		   }
		  }
		  else
		  {
			  $this->view->itemCount	=	$itemCount;
		  }
	  }
    }
    
    // Render the page
    $this->_helper->content
      // ->setNoRender()
      ->setEnabled();
  }
}
