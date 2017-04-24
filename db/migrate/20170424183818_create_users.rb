class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :profile
      t.string :pic
      t.string :city
      t.string :post

      t.timestamps
    end
  end
end
