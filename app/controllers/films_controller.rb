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
  end
end
