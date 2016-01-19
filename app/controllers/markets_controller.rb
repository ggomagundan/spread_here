class MarketsController < ApplicationController
  def index
    @flea_markets = FleaMarket.searchable.page(params[:page]).per(5)
  end

  def show
    @flea_market = FleaMarket.find(params[:id])
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(params[:market])
    if @market.save
      redirect_to @market, :notice => "Successfully created market."
    else
      render :action => 'new'
    end
  end

  def edit
    @market = Market.find(params[:id])
  end

  def update
    @market = Market.find(params[:id])
    if @market.update_attributes(params[:market])
      redirect_to @market, :notice  => "Successfully updated market."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @market = Market.find(params[:id])
    @market.destroy
    redirect_to markets_url, :notice => "Successfully destroyed market."
  end
end
