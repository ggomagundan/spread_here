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
    @content_image = ContentImage.find(params[:id])
    @content_image.destroy
    redirect_to api_content_images_url, :notice => "Successfully destroyed content image."
  end

  private 
  def image_params
    params.require(:content_image).permit(:image)
  end
end
