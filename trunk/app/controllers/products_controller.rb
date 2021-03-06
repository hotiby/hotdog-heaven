class ProductsController < ApplicationController
  # GET /products
  # GET /products.xml
  caches_action :index, :for => 1.hour
  before_filter :login_required
  #access_rule 'admin || employee || user', :only =>  [:update, :vote]
  #access_rule 'admin', :only =>  [:show, :edit, :destroy]
  access_rule 'admin', :only => :show
  def index
    @products = Product.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end
  
  def add
    product = Product.find(params[:id]) if params[:id]
    @items = Entry.find_all_by_daily_id(params[:daily].to_i)
    product.add(@items, params[:daily].to_i, product, params[:quantity].to_i)
    product.save
    @items = Entry.find_all_by_daily_id(params[:daily].to_i)
    
    @day = Daily.find(params[:daily].to_i)
    respond_to do |format|
      format.js do
        render :partial => "add_to_day"
      end
    end
  end
  
  def remove
    product = Product.find(params[:id]) if params[:id]
    product.remove(params[:daily].to_i, product, params[:quantity].to_i)
    product.save
    @items = Entry.find_all_by_daily_id(params[:daily].to_i)
    @day = Daily.find(params[:daily].to_i)
    respond_to do |format|
      format.js do
        render :partial => "add_to_day"
      end
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])
      if @product.save
        flash[:notice] = 'Video has been uploaded'
        redirect_to :action => 'index'
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to(@product) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
end
