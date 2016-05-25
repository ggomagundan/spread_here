class Api::ContentImagesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @content_image = ContentImage.new(image_params)
    @content_image.save

    respond_to do |format|
      format.json { render :json => { url: @content_image.image.url } }
    end 
  end

  def edit
  end

  def update
  end

  def destroy
    #id = del_image_params[:url].split("/").last(2).first   # FOR FIND ID
    image_name = del_image_params[:url].split("/").last     # FOR Find IMAGE_NAME 
    @content_image = ContentImage.where(image: image_name).first
    if @content_image.present?
      @content_image.destroy
      respond_to do |format| 
        format.json { render :json => { status: true } }
      end
    else
      respond_to do |format| 
        format.json { render :json => { status: false} }
      end
    end 

  end

  private 
  def image_params
    params.require(:content_image).permit(:image)
  end

  def del_image_params
    params.require(:content_image).permit(:url)
  end
end
