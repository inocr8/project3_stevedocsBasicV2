class LanguagesController < ApplicationController

  before_action :load_language, except:[:index, :create, :new]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @languages = Language.all
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)

    respond_to do |format|
      if @language.save
        format.html { redirect_to @language, notice: 'This language was successfully created.' }
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
      if @language.update(language_params)
        format.html { redirect_to @language, notice: 'This language was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @language.destroy
    redirect_to(languages_path)
  end

  private
  def language_params
    params.require(:language).permit(:name, :colour, :language_image, :description)
  end

  def load_language
    @language = Language.find(params[:id])
  end
end
