class FilmsController < ApplicationController
  def index
    @films = Film.all
    return unless params[:query]

    @films = @films.filter do |film|
      film.name.downcase
          .include?(params[:query].downcase) ||
        film.genre.downcase
            .include?(params[:query].downcase)
    end
  end

  def show
    @film = Film.find(params[:id])
    @actors = @film.actors
    @rating = Rating.find_by(user_id: current_user&.id, film_id: @film.id)&.rating
    @sign_in = current_user ? true : false
  end
end
