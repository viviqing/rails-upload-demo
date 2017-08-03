class UploadPicture < ActiveRecord::Base
  
  has_attached_file :image, :path => ":rails_root/public/system/images/:filename", :url => "/system/images/:filename"
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/jpe', 'image/jpg', 'image/pjpeg']
  validates_attachment_presence :image
  
end
