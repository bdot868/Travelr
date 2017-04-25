class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :country
      t.string :continent
      t.string :post

      t.timestamps
    end
  end
end
