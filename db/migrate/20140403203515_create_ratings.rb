class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score
      t.string :review
      t.integer :recipe_id
      t.timestamps
    end
    rename_column :recipes, :rating, :average_rating
  end
end
