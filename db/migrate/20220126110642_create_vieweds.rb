class CreateVieweds < ActiveRecord::Migration[6.1]
  def change
    create_table :vieweds do |t|
      t.belongs_to :user
      t.belongs_to :film

      t.timestamps
    end
  end
end
