# encoding: UTF-8
class CatalogController < ApplicationController
  before_filter :initialize_cart
  before_filter :except => [:show, :latest]


  def show
    @glasses = Glasses.find(params[:id])
    @page_title = @glasses.name
  end
  
  def index
    @glasses = Glasses.paginate :page => params[:page], :order => "glasses.id desc", :per_page => 5, :include => [:manufacturer]
    @page_title = 'Catálogo'
  end
  
  def latest
    @glasses = Glasses.latest 5 # invoca al metodo "lastest" para sacar los cinco ultimos libros
    @page_title = "Últimos modelos"
  end
end
