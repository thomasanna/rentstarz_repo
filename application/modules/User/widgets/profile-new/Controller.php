<?php

class User_Widget_ProfileNewController extends Engine_Content_Widget_Abstract {

public function indexAction()  {

// Don't render this if not authorized
    $viewer = Engine_Api::_()->user()->getViewer();
    if( !Engine_Api::_()->core()->hasSubject() ) {
      return $this->setNoRender();
    }

    // Get subject and check auth
    $subject = Engine_Api::_()->core()->getSubject('user');
    //if( !$subject->authorization()->isAllowed($viewer, 'view') ) {
    //  return $this->setNoRender();
    //}

    $this->view->auth = ( $subject->authorization()->isAllowed(null, 'view') );
    
    $subject = Engine_Api::_()->core()->getSubject();
    
    $userTable = Engine_Api::_()->getDbtable('users', 'user');
            
    $subjectData = $userTable->fetchRow($userTable->select()->where('user_id = ?', $subject->getIdentity()));
    
    $this->view->subjectData = $subjectData;
    
    
    /* profile photo*/
    
    
     $viewer = Engine_Api::_()->user()->getViewer();
    if( !Engine_Api::_()->core()->hasSubject() ) {
      return $this->setNoRender();
    }

    // Get subject and check auth
    $subject = Engine_Api::_()->core()->getSubject('user');

    $this->view->user = $subject;
    
    $fieldsByAlias = Engine_Api::_()->fields()->getFieldsObjectsByAlias($subject); 
    	
    	if( !empty($fieldsByAlias['profile_type']) ){
			
			  $optionId = $fieldsByAlias['profile_type']->getValue($subject);
			  $this->view->profile_type_id = $optionId->value; 
			  
		}
		
	$table = Engine_Api::_()->getItemTable('user');	
		
    if($this->view->profile_type_id == 4)	{	// landlord
    $userselect   =   $table->select()
                        ->setIntegrityCheck(false)
                        ->from(array('user'=>'engine4_users',))
                        ->joinLeft(array('search_field'=>'engine4_user_fields_search'),'search_field.item_id=user.user_id',null)                                             
                        ->joinLeft(array('country'=>'engine4_country_list',),'country.id=search_field.field_33',array('country'))                                  
                        ->joinLeft(array('state'=>'engine4_state_list',),'state.state_id=search_field.field_30',array('state'))                                  
                        ->joinLeft(array('city'=>'engine4_city_list',),'city.city_id=search_field.field_31',array('city'))                                  
                        ->where('user.search=?' , 1) 
                        ->where('user.user_id=?' , $subject->getIdentity()); 
                        
					}
	
	if($this->view->profile_type_id == 1)	{	// tenant				
									
	$userselect   =   $table->select()
                        ->setIntegrityCheck(false)
                        ->from(array('user'=>'engine4_users',))
                        ->joinLeft(array('search_field'=>'engine4_user_fields_search'),'search_field.item_id=user.user_id',null)                                          
                        ->joinLeft(array('state'=>'engine4_state_list',),'state.state_id=search_field.field_76',array('state'))                                  
                        ->joinLeft(array('city'=>'engine4_city_list',),'city.city_id=search_field.field_77',array('city'))                                  
                        ->where('user.search=?' , 1)                                          
                        ->where('user.user_id=?' , $subject->getIdentity());

            $creditscoreselect   =   $table->select()
                        ->setIntegrityCheck(false)
                        ->from(array('user'=>'engine4_users',))
                        ->joinLeft(array('search_field'=>'engine4_user_fields_search'),'search_field.item_id=user.user_id',null)                                             
                        ->joinLeft(array('fields_value'=>'engine4_user_fields_values'),'fields_value.item_id=user.user_id',array('value'))                                                                            
                        ->where('user.search=?' , 1)                     
                      //  ->where('user.level_id=?' , 7)                     
                        ->where('user.enabled=?' , 1) 
                        ->where('search_field.profile_type =?' , '1') 
                        ->where('fields_value.field_id=?' , 13) 
                        ->where('user.user_id=?' , $subject->getIdentity()) 
                        ->group('user.user_id'); 
                
            $this->view->creditscoreData = $creditscoreDataData = $table->fetchRow($creditscoreselect);		     
					}
					
	if($this->view->profile_type_id == 6)	{	// services					
					
    $userselect = $table->select()
		->setIntegrityCheck(false)
		->from(array('user'=>'engine4_users',))
		->joinLeft(array('search_field'=>'engine4_user_fields_search'),'search_field.item_id=user.user_id',null)
		->joinLeft(array('state'=>'engine4_state_list',),'state.state_id=search_field.field_54',array('state'))
		->joinLeft(array('city'=>'engine4_city_list',),'city.city_id=search_field.field_55',array('city'))
		->where('user.user_id=?' , $subject->getIdentity())
		->where('user.search=?' , 1);
		
		
	}
	
	$this->view->userselectData = $userselectData = $table->fetchRow($userselect);		
	if( Engine_Api::_()->authorization()->isAllowed('user', $subject, 'block') ) {
		 $blockTable = Engine_Api::_()->getDbtable('block', 'user');
		 $scheduledMeetingsData = $blockTable->fetchRow($blockTable->select()->where('user_id = ?', $viewer->getIdentity())
		                                                                     ->where('blocked_user_id = ?', $subject->getIdentity())
		                                                                   );
		 if(count($scheduledMeetingsData)>0){
			 $this->view->is_blocked  = 1;
		 }
		 else{
			  $this->view->is_blocked  = 0;
		 }                                                                  

	} 	  
	  $CardholderdetailsTable =  Engine_Api::_()->getDbtable('Cardholderdetails', 'user');
	  $CardholderdetailsData  =  $CardholderdetailsTable->fetchRow($CardholderdetailsTable->select()->where('userId = ?',  $subject->getIdentity()));
      $this->view->CardholderdetailsData  = $CardholderdetailsData;	
      
      // Get online users
    $table = Engine_Api::_()->getItemTable('user');
    $onlineTable = Engine_Api::_()->getDbtable('online', 'user');
    
    $tableName = $table->info('name');
    $onlineTableName = $onlineTable->info('name');
    
    $online_select = $table->select()
      ->from($tableName)
      ->joinRight($onlineTableName, $onlineTableName.'.user_id = '.$tableName.'.user_id', null)     
      ->where($onlineTableName.'.user_id > ?', 0)
      ->where($onlineTableName.'.active > ?', new Zend_Db_Expr('DATE_SUB(NOW(),INTERVAL 20 MINUTE)'))
      ->where($tableName.'.search = ?', 1)
      ->where($tableName.'.enabled = ?', 1)
      ->where($onlineTableName.'.user_id = ?', $subject->getIdentity()) 

      ; 
       $online_users_Data=$table->fetchRow($online_select);
       
       if(count($online_users_Data) >0){ $this->view->is_online= 1;}
	   else{   $this->view->is_online= 0;  }
         
}
}
