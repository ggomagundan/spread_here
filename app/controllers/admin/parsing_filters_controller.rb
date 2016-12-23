class Admin::ParsingFiltersController < Admin::ApplicationController
  def index
    @parsing_filters = ParsingFilter.page(params[:page]).per(10)
  end

  def show
    @parsing_filter = ParsingFilter.find(params[:id])
  end

  def new
    @parsing_filter = ParsingFilter.new
  end

  def create
    @parsing_filter = ParsingFilter.new(filter_params)
    if @parsing_filter.save
      redirect_to [:admin, @parsing_filter], :notice => "Successfully created parsing filter."
    else
      render :action => 'new'
    end
  end

  def edit
    @parsing_filter = ParsingFilter.find(params[:id])
  end

  def update
    @parsing_filter = ParsingFilter.find(params[:id])
    if @parsing_filter.update_attributes(filter_params)
      redirect_to [:admin, @parsing_filter], :notice  => "Successfully updated parsing filter."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @parsing_filter = ParsingFilter.find(params[:id])
    @parsing_filter.destroy
    redirect_to admin_parsing_filters_url, :notice => "Successfully destroyed parsing filter."
  end

  private
  def filter_params
    params.require(:parsing_filter).permit(:is_work, :keyword, :keyword_type)
  end


end
