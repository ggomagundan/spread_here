class Api::FleaMarketsController < Api::ApplicationController

  before_filter :latlon_check, only: :get_latlon

  def index

    @flea_markets = FleaMarket.searchable.page(params[:page]).per(6)
    @flea_markets = @flea_markets.where("STR_TO_DATE(?, '%Y-%m-%d') between str_to_date(start_date, '%Y-%m-%d') and str_to_date(end_date, '%Y-%m-%d')", params[:date]) if params[:date].present?
    @flea_markets = @flea_markets.where(city_id: params[:city]) if params[:city].present?

  end

  def show

    @flea_market = FleaMarket.find(params[:id])
    @flea_market.increment! :view_count
    @recommend = @flea_market.pick_recommend(3)

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
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

  def find_registered_location

    fleas = FleaMarket.where("location like ?","%#{params[:term]}%")

    render json: fleas.map {|x| {id: x.id, value: "#{x.location}", lat: x.latitude, lon: x.longitude}}

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
