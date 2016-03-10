class UsersController < ApplicationController
  
    before_action :load_user, except:[:index, :create, :new]
    before_action :authenticate_user!
    load_and_authorize_resource

    def index
      @users = User.all
    end

    def show
    end

    def edit
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'This user was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @user.destroy
      redirect_to(users_path)
    end

    private
      def user_params
        params.require(:user).permit(:name, :email, :role, :twitter, :company, :bio, :user_image)
      end

    def load_user
      @user = User.find(params[:id])
    end
  end
