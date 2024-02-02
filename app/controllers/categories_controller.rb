class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @categories = current_user.categories
    @item = Item.where(author_id: current_user.id)
    @total_amount = @item.sum(:amount)
    @category_totals = calculate_totals
  end

  def show
    @category = Category.find_by(id: params[:id])
    @items = Item.where(category_id: params[:id]).order(created_at: :desc)
    @total_amount = @category.items.sum(:amount)
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy!

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  def calculate_totals
    category_totals = {}

    @categories.each do |category|
      category_items = Item.where(category_id: category.id)

      total = category_items.sum(:amount)
      category_totals[category.name] = total
    end

    category_totals
  end
  helper_method :calculate_totals

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
