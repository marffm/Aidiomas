<?php

class Document {

	protected $registry;

	public $data = array();

	function __construct($registry) {
		$this->registry = $registry;
	}


	public function setTitle($title) {
		return $this->data['pageTitle'] = $title;
	}

	public function getTitle() {
		return $this->data['pageTitle'];
	}

}