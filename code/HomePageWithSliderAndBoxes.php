<?php

    class HomePageWithSliderAndBoxes extends HomePage {
        public static $db = array(
            "NoMargin" => "Boolean"
          );

        public static $has_many = array(
            "Boxes" => "Box"
        ); 

        function getCMSFields(){
            $fields = parent::getCMSFields();

            $fields->removeByName("Map");
            $fields->addFieldToTab("Root.Boxes", new CheckBoxField('NoMargin','No gaps between boxes'));                  
            $gridFieldBoxConfig = GridFieldConfig::create()->addComponents(
              new GridFieldSortableRows('SortOrder'),                         
              new GridFieldToolbarHeader(),
              new GridFieldAddNewButton('toolbar-header-right'),
              new GridFieldSortableHeader(),
              new GridFieldDataColumns(),
              new GridFieldPaginator(30),
              new GridFieldEditButton(),
              new GridFieldDeleteAction(),
              new GridFieldDetailForm()
            );

            $gridField = new GridField("Boxes", "Boxes", $this->Boxes(), $gridFieldBoxConfig);
            $fields->addFieldToTab("Root.Boxes", $gridField);                  
            return $fields;
        }        
         
    }

    class HomePageWithSliderAndBoxes_Controller extends Page_Controller{


    }
