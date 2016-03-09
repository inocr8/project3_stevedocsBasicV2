class CategoriesController < ApplicationController

  before_action :load_category, except:[:index, :create, :new]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'This category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'This category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @category.destroy
    redirect_to(categories_path)
  end

  private
  def category_params
    params.require(:category).permit(:name, :colour, :category_image, :description)
  end

  def load_category
    @category = Category.find(params[:id])
  end
end
