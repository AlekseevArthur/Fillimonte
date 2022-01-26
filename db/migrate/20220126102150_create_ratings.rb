class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.belongs_to :user
      t.belongs_to :film
      t.integer :rating

      t.timestamps
    end
  end
end
