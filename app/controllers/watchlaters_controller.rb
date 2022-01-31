class WatchlatersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    @wl = Watchlater.new(user_id: current_user.id, film_id: params[:film_id])
    respond_to do |format|
      if @wl.save
        format.json { render json: @wl, status: :created }
        format.html { render json: @wl, status: :created }
      else
        format.json { render json: @wl.errors, status: :unprocessable_entity }
        format.html { render json: @wl.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wl = current_user.watchlaters.find_by(film_id: params[:film_id])
    @wl.destroy
    respond_to do |format|
      format.json { render json: @wl, status: 204 }
      format.html { render json: @wl, status: 204 }
    end
  end
end
