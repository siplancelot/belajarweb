<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

  public function __construct(){

    parent:: __construct();
	
    $this->load->model(array('product_model'));
  }
	
	public function index()
	{

    $products = $this->product_model->getData();

    $data = array(
      'title' => "Home",
      "page" => 'pages/landing/product',
      'products' => $products
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
