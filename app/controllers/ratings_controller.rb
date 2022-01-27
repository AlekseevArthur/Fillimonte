class RatingsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update]

  def create
    @rating = Rating.new({ user_id: current_user.id, film_id: params[:film_id], rating: params[:rating] })
    respond_to do |format|
      if @rating.save
        format.json { render json: @rating, status: :created }
        format.html { render json: @rating, status: :created }
      else
        format.json { render json: @rating.errors, status: :unprocessable_entity }
        format.html { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @rating = Rating.new({ user_id: current_user.id, film_id: params[:film_id], rating: params[:rating] })
    respond_to do |format|
      if @rating.save
        format.json { render json: @rating, status: :ok }
        format.html { render json: @rating, status: :ok }
      else
        format.json { render json: @rating.errors, status: :unprocessable_entity }
        format.html { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end
end
