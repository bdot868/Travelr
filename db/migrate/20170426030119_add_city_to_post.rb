class AddCityToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :city, :string
  end
end
