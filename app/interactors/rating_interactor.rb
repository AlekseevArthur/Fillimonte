class RatingInteractor
  include Interactor

  def call
    context.result = context.film.ratings.find_by(user_id: context.user_id)&.rating
  end
end
