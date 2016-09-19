class Admin::ParsingsController < Admin::ApplicationController
  def index
    @parsings = Parsing.page(params[:page]).per(20)
  end

  def edit
    @parsing = Parsing.find(params[:id])
  end

  def update
    @parsing = Parsing.find(params[:id])
    if @parsing.update_attributes(parse_params)
      redirect_to admin_parsings_path, :notice  => "Successfully updated parsing."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @parsing = Parsing.find(params[:id])
    @parsing.destroy
    redirect_to admin_parsings_url, :notice => "Successfully destroyed parsing."
  end

  private
  def parse_params
    params.require(:parsing).permit(:tags, :image_url, :content )
  end
  
end
