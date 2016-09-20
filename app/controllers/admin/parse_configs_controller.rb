class Admin::ParseConfigsController < Admin::ApplicationController
  def index
    @parse_configs = ParseConfig.page(params[:page]).per(20)
    redirect_to edit_admin_parse_config_path(@parse_configs.first)
  end

  def show
    @parse_config = ParseConfig.find(params[:id])
  end

  def new
    @parse_config = ParseConfig.new
  end

  def create
    @parse_config = ParseConfig.new(config_params)
    if @parse_config.save
      redirect_to [:admin, @parse_config], :notice => "Successfully created parse config."
    else
      render :action => 'new'
    end
  end

  def edit
    @parse_config = ParseConfig.find(params[:id])
  end

  def update
    @parse_config = ParseConfig.find(params[:id])
    if @parse_config.update_attributes(config_params)
      redirect_to edit_admin_parse_config_path(@parse_config), :notice  => "Successfully updated parse config."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @parse_config = ParseConfig.find(params[:id])
    @parse_config.destroy
    redirect_to admin_parse_configs_url, :notice => "Successfully destroyed parse config."
  end

  private
  def config_params
    params.require(:parse_config).permit(:cookie)
  end
end
