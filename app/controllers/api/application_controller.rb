class Api::ApplicationController < ActionController::Base


  before_action :authenticate_user!
  before_action :make_json
  protect_from_forgery with: :exception

  def make_json
    @json_result = JsonResult.new
    @json_result.status = true
    request.format = :json
  end

end
