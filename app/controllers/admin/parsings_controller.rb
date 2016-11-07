class Admin::ParsingsController < Admin::ApplicationController

  before_filter :set_params, only: :index

  def index
    @parsings = Parsing.order("is_complete asc, id desc").page(@page).per(@per)
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
    @parsing.update_attributes(is_complete: 1)
    respond_to do |format|
      format.html { head :ok }
      format.json { head :no_content } 
    end
    #redirect_to admin_parsings_path(page: params[:page]), :notice  => "Successfully updated parsing."
  end

  def move

    @parsing = Parsing.find(params[:id])
    flea = FleaMarket.new(is_visible: 0, bottom_text: @parsing.content)
    flea.remote_top_image_url = @parsing.image_url
    flea.remote_list_image_url = @parsing.image_url
    if flea.save
      @parsing.update_attributes(is_complete: 2)
      con = flea.content_images.new
      con.remote_image_url = @parsing.image_url
      con.save
      @parsing.tags.split(",").each do |t_name|
        t_name = t_name.strip
        if t_name != "플리마켓"
          flea.fleamarket_tags.new(tag_name: t_name).save
        end
      end
      redirect_to edit_admin_flea_market_path(flea), turbolinks: true
      #redirect_via_turbolinks_to edit_admin_flea_market_path(flea)
    else
      render :back
    end

  end

  private
  def parse_params
    params.require(:parsing).permit(:tags, :image_url, :content )
  end

  def set_params

    @per = params[:per].present?? params[:per] : 40
    @page = params[:page].present?? params[:page] :1

  end
  
end
