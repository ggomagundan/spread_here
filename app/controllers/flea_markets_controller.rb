class FleaMarketsController < ApplicationController
  def index
    @flea_markets = FleaMarket.searchable.page(params[:page]).per(5)
  end

  def show
    @flea_market = FleaMarket.find(params[:id])
  end

  def new
    @flea_market = FleaMarket.new
  end

  def create
    @flea_market = FleaMarket.new(flea_params)
    if @flea_market.save
      redirect_to flea_markets_path
    else
      render :action => 'new'
    end
  end

  def edit
    @flea_market = FleaMarket.find(params[:id])
  end

  def update
    @flea_marekt = FleaMarket.find(params[:id])
    if @flea_market.update_attributes(flea_params)
      redirect_to flea_markets_path
    else
      render :action => 'edit'
    end
  end

  private

  def flea_params
    params.require(:flea_market).permit(:market_name, :start_date, :end_date, :location, :memo, :latitude, :longitude)

  end
end
