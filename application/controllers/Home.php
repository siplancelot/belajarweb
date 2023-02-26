<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	
	public function index()
	{

    $data = array(
      'title' => "Home",
      "page" => 'pages/landing/product'
    );


		$this->load->view('theme/landing', $data);
	}

  public function checkout()
	{

    $data = array(
      'title' => "Checkout",
      "page" => 'pages/landing/checkout'
    );


		$this->load->view('theme/landing', $data);
	}


}
