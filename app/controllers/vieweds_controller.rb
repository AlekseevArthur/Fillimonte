class ViewedsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    @viewed = Viewed.new(user_id: current_user.id, film_id: params[:film_id])
    respond_to do |format|
      if @viewed.save
        format.json { render json: @viewed, status: :created }
        format.html { render json: @viewed, status: :created }
      else
        format.json { render json: @viewed.errors, status: :unprocessable_entity }
        format.html { render json: @viewed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @viewed = current_user.vieweds.find_by(film_id: params[:film_id])
    @viewed.destroy
    respond_to do |format|
      format.json { render json: @viewed, status: 204 }
      format.html { render json: @viewed, status: 204 }
    end
  end
end
