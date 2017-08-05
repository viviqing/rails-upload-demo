class UploadPicturesController < ApplicationController
  before_action :set_upload_picture, only: [:show, :edit, :update, :destroy]

  # GET /upload_pictures
  # GET /upload_pictures.json
  def index
    @upload_pictures = UploadPicture.order('start_date desc')
  end

  # GET /upload_pictures/1
  # GET /upload_pictures/1.json
  def show
  end

  # GET /upload_pictures/new
  def new
    @upload_picture = UploadPicture.new
  end

  # GET /upload_pictures/1/edit
  def edit
  end

  # POST /upload_pictures
  # POST /upload_pictures.json
  def create
    @upload_picture = UploadPicture.new(upload_picture_params)

    respond_to do |format|
      if @upload_picture.save
        format.html { redirect_to @upload_picture, notice: 'Upload picture was successfully created.' }
        format.json { render :show, status: :created, location: @upload_picture }
      else
        format.html { render :new }
        format.json { render json: @upload_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /upload_pictures/1
  # PATCH/PUT /upload_pictures/1.json
  def update
    respond_to do |format|
      if @upload_picture.update(upload_picture_params)
        format.html { redirect_to @upload_picture, notice: 'Upload picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload_picture }
      else
        format.html { render :edit }
        format.json { render json: @upload_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upload_pictures/1
  # DELETE /upload_pictures/1.json
  def destroy
    @upload_picture.destroy
    respond_to do |format|
      format.html { redirect_to upload_pictures_url, notice: 'Upload picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def main
    @picture = UploadPicture.where([UploadPicture.arel_table[:start_date].not_eq(nil), UploadPicture.arel_table[:start_date].lt(Date.today)].reduce(&:and)).order('start_date desc').first
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload_picture
      @upload_picture = UploadPicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_picture_params
      params.require(:upload_picture).permit(:image, :start_date, :description, :image_file_name, :image_content_type, :image_file_size)
    end
end
