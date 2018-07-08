class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "You created #{@category.title}!"
      redirect_to category_path(@category)
    else
      flash.now[:error] = "Category must be unique."
      redirect_to new_category_path
    end
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    if @company.save
      flash[:success] = "#{@company.name} updated!"
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title)
    end
end
