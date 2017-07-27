class UploadPicture < ActiveRecord::Base
  VALID_IMAGE_TYPE = ['image/jpeg', 'image/png', 'image/gif', 'image/jpe', 'image/jpg', 'image/pjpeg']
  IMAGE_MIN_WIDTH = 940;
	IMAGE_MIN_HEIGHT = 400;
  
  def self.check_picture(picture, upload_flag = nil)
    result = { :status => 'success' }
    # check file type
    if !VALID_IMAGE_TYPE.include?(picture.content_type)
      result[:status] = 'fail'
      result[:message] = "Sorry, image type is only jpg, gif or png"
    else
      begin
        file_type = File.extname(picture.original_filename).downcase
        image = open_image(picture.path, upload_flag)
        # check file size
        if image[:width] < IMAGE_MIN_WIDTH || image[:height] < IMAGE_MIN_HEIGHT
          result[:status] = 'fail'
          result[:message] = "Image's width must equal or bigger than #{IMAGE_MIN_WIDTH}px and height must equal or bigger than #{IMAGE_MIN_HEIGHT}px"
        end
      rescue Exception => ex
        result[:status] = 'fail'
        # result[:message] = "An error occurred while transferring the file"
        result[:message] = ex
      end
    end
    result
  end
  
  def self.open_image(path, upload_flag)
    upload_flag.nil? ? MiniMagick::Image.open(path) : MiniMagick::Image.read(path)
  end
end
