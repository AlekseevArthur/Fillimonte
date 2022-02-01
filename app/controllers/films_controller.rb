class FilmsController < ApplicationController
  def index
    @films = Film.all
    if current_user
      @films = @films.map do |film|
        new_film = film.attributes
        new_film[:watchlater] = Watchlater.exists?(user_id: current_user.id, film_id: film.id)
        new_film[:viewed] = Viewed.exists?(user_id: current_user.id, film_id: film.id)
        new_film
      end
    end

    return unless params[:query]

    @films = @films.filter do |film|
      film['name'].downcase
                  .include?(params[:query].downcase) ||
        film['genre'].downcase
                     .include?(params[:query].downcase)
    end
  end

  def show
    @film = Film.find(params[:id])
    @actors = @film.actors
    @rating = Rating.find_by(user_id: current_user&.id, film_id: @film.id)&.rating
    @sign_in = current_user ? true : false
    @new_film = @film.attributes
    return unless @sign_in

    @new_film[:watchlater] = Watchlater.exists?(user_id: current_user&.id, film_id: @film.id)
    @new_film[:viewed] = Viewed.exists?(user_id: current_user.id, film_id: @film.id)
  end
end
