class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: %i[create destroy]

  def index
    @comments = Film.find(params[:film_id]).comments
  end

  def create
    @comment = Comment.new(
      film_id: params[:film_id],
      text: params[:comment],
      user_id: current_user.id
    )
    respond_to do |format|
      if @comment.save
        format.json { render json: @comment, status: :created }
        format.html { render json: @comment, status: :created }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.html { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy if permission(params[:id])
    respond_to do |format|
      format.json { render json: @comment, status: 204 }
      format.html { render json: @comment, status: 204 }
    end
  end

  def permission(id)
    current_user&.id == Comment.find(id).user.id
  end
end
