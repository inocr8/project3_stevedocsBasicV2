class LibrariesController < ApplicationController

  before_action :load_booking, except:[:index, :create, :new]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    if can? :manage, :all
      @libraries = Library.all
      @users = User.all
    else
      @libraries = Library.where(user_id: current_user)
    end
  end

  def new
    @library = Library.new
  end

  def create
    @library = current_user.libraries.new(library_params)
    respond_to do |format|
      if @library.save
        format.html { redirect_to @library, notice: 'Document was successfully saved to your library.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    respond_to do |format|
      if @library.destroy
        format.html { redirect_to libraries_path, notice: 'Document was successfully deleted from your library.' }
      end
    end
  end

  private
    def library_params
      params.require(:library).permit(:document_id)
    end

  def load_library
    @library = Library.find(params[:id])
  end
end
