class Admin::FleaMarketsController < Admin::ApplicationController
  def index

    @flea_markets = FleaMarket.admin_list.page(params[:page]).per(10)
    @flea_markets = @flea_markets.where("market_name like ?", "%#{params[:name]}%") if params[:name].present?
  end

  def show
    @flea_market = FleaMarket.find(params[:id])
  end

  def new
    @flea_market = FleaMarket.new
  end

  def create
    @flea_market = FleaMarket.new(market_params)
    if @flea_market.save
      redirect_to admin_flea_markets_path, :notice => "Successfully created flea market."
    else
      render :action => 'new'
    end
  end

  def edit
    @flea_market = FleaMarket.find(params[:id])
  end

  def update
    @flea_market = FleaMarket.find(params[:id])
    if @flea_market.update_attributes(market_params)
      redirect_to admin_flea_markets_path, :notice  => "Successfully updated flea market."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @flea_market = FleaMarket.find(params[:id])
    @flea_market.destroy
    redirect_to admin_flea_markets_url, :notice => "Successfully destroyed flea market."
  end

  private
  def market_params
    params.require(:flea_market).permit(:is_visible, :market_name, :location, :memo, :list_image, :top_image, :start_date, :end_date,\
                                        :priority, :top_text, :bottom_text, \
                                        :latitude, :longitude, :city_id, \
                                       :fleamarket_images_attributes => [:id, :image, :sort, :_destroy], \
                                       :fleamarket_tags_attributes => [:id, :tag_name, :_destroy])
  end

end
