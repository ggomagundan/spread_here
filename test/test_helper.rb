ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase

  # include Devise::Test::ControllerHelpers
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

=begin
  def sign_in(user)
    post user_session_path \
      'user[email]'    => user.email,
      'user[password]' => user.password
  end
=end
  # Add more helper methods to be used by all tests here...
end
