class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.authored_categories.includes(:transactions, :author).order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = current_user.authored_categories.build(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
