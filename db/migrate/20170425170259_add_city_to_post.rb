class AddCityToPost < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :city, foreign_key: true
  end
end
