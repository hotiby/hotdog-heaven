class DailiesController < ApplicationController
  # GET /dailies
  # GET /dailies.xml
  def index
    @dailies = Daily.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dailies }
    end
  end
  
  def create_product
    @product = Product.find_by_title(params[:products])
    @comment = @daily.products.build(params[:comment])
    @comment.user_id = current_user.id if logged_in?
    @comment.save if params[:form_action] == 'save'
    respond_to do |format|
      format.js
    end
  end

  # GET /dailies/1
  # GET /dailies/1.xml
  def show
    @daily = Daily.find(params[:id])
    @products = Product.find(:all)#.map{|role| role.title}

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @daily }
    end
  end

  # GET /dailies/new
  # GET /dailies/new.xml
  def new
    @daily = Daily.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @daily }
    end
  end

  # GET /dailies/1/edit
  def edit
    @daily = Daily.find(params[:id])
  end

  # POST /dailies
  # POST /dailies.xml
  def create
    @daily = Daily.new(params[:daily])
    @daily.date = params[:date]
    respond_to do |format|
      if @daily.save
        format.html { redirect_to(@daily) }
        format.xml  { render :xml => @daily, :status => :created, :location => @daily }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @daily.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dailies/1
  # PUT /dailies/1.xml
  def update
    @daily = Daily.find(params[:id])

    respond_to do |format|
      if @daily.update_attributes(params[:daily])
        flash[:notice] = 'Daily was successfully updated.'
        format.html { redirect_to(@daily) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @daily.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dailies/1
  # DELETE /dailies/1.xml
  def destroy
    @daily = Daily.find(params[:id])
    @daily.destroy

    respond_to do |format|
      format.html { redirect_to(dailies_url) }
      format.xml  { head :ok }
    end
  end
end
