require File.dirname(__FILE__) + '/../../test_helper'
require 'admin/manufacturer_controller'

class Admin::ManufacturerController; def rescue_action(e) raise e end; end  

class Admin::ManufacturerControllerTest < ActionController::TestCase
  fixtures :manufacturers

  setup do
    @controller = Admin::ManufacturerController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end
  test "new" do
    get :new
    assert_response :success
    assert_template 'admin/manufacturer/new'
    assert_tag 'h1', :content => 'Crear nuevo Fabricante'
    assert_tag 'form', :attributes => {:action => '/admin/manufacturer/create'}
  end

  test "create" do
    get :new
    assert_template 'admin/manufacturer/new'
    assert_difference(Manufacturer, :count) do
    	post :create, :manufacturer => {:company_name => 'Arnette'}
	assert_response :redirect
    	assert_redirected_to :action => 'index'
     end
     assert_equal 'Fabricante Arnette ha sido creado con exito.', flash[:notice]
  end
  
  def test_failing_create
    assert_no_difference(Manufacturer, :count) do
      post :create, :manufacturer => {:company_name => ''}
      assert_response :success
      assert_template 'admin/manufacturer/new'
      assert_tag :tag => 'div', :attributes => {:class => 'field_with_errors'}
    end
  end
  
  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "show" do
    get :show, :id => 1
    assert_template 'admin/manufacturer/show'
    assert_equal 'Arnette', assigns(:manufacturer).company_name
    assert_equal 'California', assigns(:manufacturer).city
  end

  test "index" do
    get :index
    assert_response :success
    assert_tag :tag => 'table', :children => { :count => Manufacturer.count + 1, :only => {:tag => 'tr'} }
    Manufacturer.find(:all).each do |a|
      assert_tag :tag => 'td', :content => a.company_name
    end
  end

end
