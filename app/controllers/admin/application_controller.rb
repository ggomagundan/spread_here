class Admin::ApplicationController < ActionController::Base


  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'admin'

=begin
   def default_url_options(options = {})
     { page: params[:page]  }.merge options
   end
=end 

end
