class CommentsController < ApplicationController

    before_action :load_comment, except:[:index, :create, :new]
    before_action :authenticate_user!
    load_and_authorize_resource

    def new
      @comment = Comment.new
    end

    def create
      current_user.comments.create(comment_params)
      redirect_to document_path(params['comment']['document_id'])
    end

    def edit
    end

    def update
      @comment.update(comment_params)
      redirect_to document_path(@comment.document)

    end

    def destroy
      document_id = @comment.document_id
      @comment.destroy
      redirect_to document_path(document_id)
    end

    private
      def comment_params
        params.require(:comment).permit(:document_id, :content)
      end

    def load_comment
      @comment = Comment.find(params[:id])
    end
  end
