class AddIndexRatings < ActiveRecord::Migration
  def change
  	change_column :ratings, :user_id, :integer, references: :users
  	change_column :ratings, :recipe_id, :integer, references: :recipes
  	add_index :ratings, [:user_id, :recipe_id], :unique => true
  end
end
