class CreatePostCategoryShips < ActiveRecord::Migration[7.0]
  def change
    create_table :post_category_ships do |t|
      t.references :category
      t.references :post
      t.timestamps
    end
  end
end
