class CreateWatchlaters < ActiveRecord::Migration[6.1]
  def change
    create_table :watchlaters do |t|
      t.belongs_to :user
      t.belongs_to :film

      t.timestamps
    end
  end
end
