<?php

	class Box extends DataObject{
		
		public static $db = array(
			'Title' => 'Varchar(200)',
			'Description' => 'Text',
            'ExternalLink' => 'Text',
            'HTMLSnippet' => 'HTMLText',
            'SortOrder'=>'Int',
			'Colour' => 'Varchar(20)',
			'TextColour' => 'Varchar(20)',
			'DropShadow' => 'Boolean',
            'TextPosition' => 'Varchar(80)'                 
		);
		
		public static $has_one = array(
			'BoxImage' => 'Image',
			'BoxHomePage' => 'BoxHomePage',
			'HomePageWithSliderAndBoxes' => 'HomePageWithSliderAndBoxes',
			'Page' => 'SiteTree'
		);
                
        public static $default_sort='SortOrder';		
        
		public function getCMSFields() {
			$colourDrop=DropdownField::create('Colour','Box background colour', array(
				'unselected' => 'unselected',
				'black' => 'black',
				'blue' => 'blue',
				'brown'=> 'brown',
				'green' => 'green',
				'greyGreen' => 'greyGreen',
				'lightPurple' => 'lightPurple',
				'maroon' => 'maroon',
				'red' => 'red',
				'white' => 'white'
			 ));

			$textColourDrop=DropdownField::create('TextColour','Text colour', array(
				'unselected' => 'unselected',
				'blacktext' => 'black',
				'greytext' => 'grey',
				'whitetext' => 'white'));

			$positionDrop=DropdownField::create('TextPosition','Text position', array(
				'unselected' => 'unselected',
				'top' => 'top',
				'middle' => 'middle',
				'bottom'=> 'bottom'));

			return new FieldList(
				new TextField('Title', 'Box title'),
				$colourDrop,
				$textColourDrop,
				$positionDrop,
				new CheckBoxfield('DropShadow','Add a drop shadow to the text'),
				new TextareaField('Description', 'Box description'),
				new TextareaField('HTMLSnippet', 'HTML paste'),
                new TextField('ExternalLink', 'External link - needs to start with http:\\'),
				new TreeDropdownField('PageID', 'Select a page to link to from the image', 'SiteTree'),
				new UploadField('BoxImage', 'Image')
			);
		}
		
	}
