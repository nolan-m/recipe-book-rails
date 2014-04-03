class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :ingredients
      t.text :directions
      t.integer :rating
      t.timestamps
    end

    create_table :tags do |t|
      t.string :name
    end

    create_table :recipes_tags do |t|
      t.integer :recipe_id
      t.integer :tag_id
    end
  end
end
