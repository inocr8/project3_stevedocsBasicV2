class DocumentsController < ApplicationController

  before_action :load_document, except:[:index, :create, :new]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @documents = Document.all
  end
  
  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'This document was successfully created.' }
      else
        format.html { render :new }
      end
    end
    
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'This document was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @document.destroy
    redirect_to(documents_path)
  end

  private
    def document_params
      params.require(:document).permit(:name, :short, :tags, :content, :document_image, :category_id, :language_id)
    end

  def load_document
    @document = Document.find(params[:id])
  end
end

