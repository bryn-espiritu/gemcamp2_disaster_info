class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :tittle
      t.string :content
      t.string :address
      t.timestamps
    end
  end
end
