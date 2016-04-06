class Admin::FleaMarketsController < Admin::ApplicationController
  def index
    @flea_markets = FleaMarket.page(params[:page]).per(20)
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
      redirect_to [:admin, @flea_market], :notice => "Successfully created flea market."
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
      redirect_to [:admin, @flea_market], :notice  => "Successfully updated flea market."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @flea_market = FleaMarket.find(params[:id])
    @flea_market.destroy
    redirect_to admin_flea_markets_url, :notice => "Successfully destroyed flea market."
  end
end
