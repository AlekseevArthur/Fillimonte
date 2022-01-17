class CreateFilmsAndActors < ActiveRecord::Migration[6.1]
  def change
    create_table :films do |t|
      t.string :name
      t.text   :description
      t.string :genre
      t.date   :release_date
      t.string :director
      t.string :image_url
      t.string :rating
      t.string :trailer

      t.timestamps
    end

    create_table :actors do |t|
      t.string :name
      t.string :image_url

      t.timestamps
    end

    create_table :films_actors, id: false do |t|
      t.belongs_to :actors
      t.belongs_to :films
    end
  end
end
