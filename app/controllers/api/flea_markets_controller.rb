class Api::FleaMarketsController < Api::ApplicationController

  before_filter :latlon_check

  def index
    @flea_markets = FleaMarket.all
  end

  def show
    @flea_market = FleaMarket.find(params[:id])
  end

  def new
    @flea_market = FleaMarket.new
  end

  def create
    @flea_market = FleaMarket.new(params[:flea_market])
    if @flea_market.save
      redirect_to [:api, @flea_market], :notice => "Successfully created flea market."
    else
      render :action => 'new'
    end
  end

  def edit
    @flea_market = FleaMarket.find(params[:id])
  end

  def update
    @flea_market = FleaMarket.find(params[:id])
    if @flea_market.update_attributes(params[:flea_market])
      redirect_to [:api, @flea_market], :notice  => "Successfully updated flea market."
    else
      render :action => 'edit'
    end
  end

  def destroy

  end

  def get_latlon

    url = "#{DAUM_FIND_LATLON_URL}&q=#{params[:addr]}"
    uri = URI(URI::escape(url))
    res = JSON.parse(Net::HTTP.get(uri))
    res = res["channel"]["item"]
    render json: res


  end

  private
  def latlon_check

    if params[:addr].blank?
      @json_result.status = false
      @json_result.message = "Not Present Addr parameter"
      render json: @json_result
    end


  end
end
