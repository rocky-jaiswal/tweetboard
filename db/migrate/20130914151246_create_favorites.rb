class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :user_name
      t.string :user_id

      t.timestamps
    end
  end
end
