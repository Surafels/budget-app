class ItemsController < ApplicationController
  # before_action :set_item, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /items or /items.json
  def index
    @items = Item.includes.call(:items).all
  end

  # GET /items/1 or /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    @item = Item.new
    @categories = Category.includes(:items).all
  end

  # GET /items/1/edit
  def edit; end

  def create
    @categories = Category.all
    @item = Item.new(item_params)
    @item.author = current_user
    if @item.save
      redirect_to category_path(@item.category_id)
    else
      render :new
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy!

    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    # params.require(:item).permit(:name, :amount, :category_id)
    params.require(:item).permit(:name, :amount, :category_id).merge(user_id: current_user.id)
  end
end
