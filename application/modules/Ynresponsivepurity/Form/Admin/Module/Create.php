<?php

class Ynresponsivepurity_Form_Admin_Module_Create extends Engine_Form
{
    public function init()
    {
        $this->setTitle('Add Module')
            ->setAttrib('id', 'ynrespnosive_purity_create_form')
            ->setAttrib('class', 'global_form_popup')
            ->setMethod("POST")
            ->setAction(Zend_Controller_Front::getInstance()->getRouter()->assemble(array()));

        // Title
        $this->addElement('Text', 'title', array(
            'label' => 'Module Title',
            'description' => 'Max 64 characters',
            'allowEmpty' => false,
            'required' => true,
            'validators' => array(
                array('NotEmpty', true),
                array('StringLength', false, array(1, 64)),
            ),
            'filters' => array(
                'StripTags',
                new Engine_Filter_Censor(),
            ),
        ));
        $this->title->getDecorator("Description")->setOption("placement", "append");
        $this->title->setAttrib('required', true);

        // Link
        $this->addElement('Text', 'link', array(
            'label' => 'Module Link',
            'description' => 'Max 256 characters',
            'validators' => array(
                array('NotEmpty', true),
                array('StringLength', false, array(1, 256)),
            ),
            'filters' => array(
                'StripTags',
                new Engine_Filter_Censor(),
            ),
        ));
        $this->link->getDecorator("Description")->setOption("placement", "append");

        // Description
        $this->addElement('Textarea', 'description', array(
            'label' => 'Module Description',
            'description' => 'Max 512 characters.',
            'maxlength' => 512,
            'filters' => array(
                new Engine_Filter_Censor(),
                new Engine_Filter_EnableLinks(),
                new Engine_Filter_StringLength(array('max' => 512)),
            ),
        ));
        $this->description->getDecorator("Description")->setOption("placement", "append");

        // Icon
        $this->addElement('File', 'photo', array(
            'label' => '*Icon',
            'description' => 'Recommended dimensions 46px x 46px',
            'allowEmpty' => false,
            'required' => true,
        ));
        $this->photo->addValidator('Extension', false, 'jpg,png,gif,jpeg');
        $this->photo->getDecorator("Description")->setOption("placement", "append");

        // Icon hover
        $this->addElement('File', 'hover_photo', array(
            'label' => '*Hover Icon',
            'description' => 'Recommended dimensions 46px x 46px',
            'allowEmpty' => false,
            'required' => true,
        ));
        $this->hover_photo->addValidator('Extension', false, 'jpg,png,gif,jpeg');
        $this->hover_photo->getDecorator("Description")->setOption("placement", "append");

        // Buttons
        $this->addElement('Button', 'submit', array(
            'label' => 'Add',
            'type' => 'submit',
            'ignore' => true,
            'decorators' => array(
                'ViewHelper',
            ),
        ));

        $this->addElement('Cancel', 'cancel', array(
            'label' => 'cancel',
            'link' => false,
            'onClick' => 'javascript:parent.Smoothbox.close();',
            'prependText' => ' or ',
            'decorators' => array(
                'ViewHelper',
            ),
        ));

        $this->addDisplayGroup(array('submit', 'cancel'), 'buttons', array(
            'decorators' => array(
                'FormElements',
                'DivDivDivWrapper',
            ),
        ));
    }
}