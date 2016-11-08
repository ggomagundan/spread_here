class FleaMarketsController < ApplicationController
  def index
    @flea_markets = FleaMarket.searchable.page(params[:page]).per(6)
    @flea_markets = @flea_markets.where("STR_TO_DATE(?, '%Y-%m-%d') between str_to_date(start_date, '%Y-%m-%d') and str_to_date(end_date, '%Y-%m-%d')", params[:date]) if params[:date].present?
    @flea_markets = @flea_markets.where(city_id: params[:city]) if params[:city].present?
  end

  def show
    @flea_market = FleaMarket.find(params[:id])
    #@flea_market.delay.increment! :view_count
    FleaMarketJob.perform_later(@flea_market)
    @recommend = @flea_market.pick_recommend(3)
  end

  def new
    @flea_market = FleaMarket.new
  end

  def create
    @flea_market = FleaMarket.new(flea_params)
    @flea_market.is_visible = 2
    if @flea_market.save
      MarketNoticeMailer.market_apply(@flea_market).deliver_later
      redirect_to flea_markets_path, notice: "성공적으로 등록 요청 되었습니다."
    else
      render :action => 'new'
    end
  end

  def edit
    redirect_to root_path
  end

  def update
    redirect_to root_path
  end

  private

  def flea_params
    params.require(:flea_market).permit(:market_name, :start_date, :end_date, :location, :memo, :latitude, :longitude, :top_text)
  end
end
