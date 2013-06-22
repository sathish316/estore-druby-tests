class DeliveryItemsController < ApplicationController
  # GET /delivery_items
  # GET /delivery_items.json
  def index
    @delivery_items = DeliveryItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @delivery_items }
    end
  end

  # GET /delivery_items/1
  # GET /delivery_items/1.json
  def show
    @delivery_item = DeliveryItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @delivery_item }
    end
  end

  # GET /delivery_items/new
  # GET /delivery_items/new.json
  def new
    @delivery_item = DeliveryItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @delivery_item }
    end
  end

  # GET /delivery_items/1/edit
  def edit
    @delivery_item = DeliveryItem.find(params[:id])
  end

  # POST /delivery_items
  # POST /delivery_items.json
  def create
    @delivery_item = DeliveryItem.new(params[:delivery_item])

    respond_to do |format|
      if @delivery_item.save
        format.html { redirect_to @delivery_item, notice: 'Delivery item was successfully created.' }
        format.json { render json: @delivery_item, status: :created, location: @delivery_item }
      else
        format.html { render action: "new" }
        format.json { render json: @delivery_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /delivery_items/1
  # PUT /delivery_items/1.json
  def update
    @delivery_item = DeliveryItem.find(params[:id])

    respond_to do |format|
      if @delivery_item.update_attributes(params[:delivery_item])
        format.html { redirect_to @delivery_item, notice: 'Delivery item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @delivery_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_items/1
  # DELETE /delivery_items/1.json
  def destroy
    @delivery_item = DeliveryItem.find(params[:id])
    @delivery_item.destroy

    respond_to do |format|
      format.html { redirect_to delivery_items_url }
      format.json { head :no_content }
    end
  end
end
