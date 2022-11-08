class AddDeleteToPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :unique_num
  end
end
