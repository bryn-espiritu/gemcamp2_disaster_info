class AddDefaultToCategory < ActiveRecord::Migration[7.0]
  def change
    Category.find_or_create_by(name: "Typhoon")
    Category.find_or_create_by(name: "Earthquake")
    Category.find_or_create_by(name: "COVID")
  end
end
