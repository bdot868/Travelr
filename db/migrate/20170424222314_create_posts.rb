class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :video_url
      t.string :pic_url
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
