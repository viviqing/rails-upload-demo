class CreateUploadPictures < ActiveRecord::Migration
  def change
    create_table :upload_pictures do |t|
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.string :description
      t.date :scheduled_date
      t.timestamps null: false
    end
  end
end
