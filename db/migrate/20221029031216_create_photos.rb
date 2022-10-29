class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :image_url
      t.date :date
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end