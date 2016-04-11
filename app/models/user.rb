class User < ActiveRecord::Base
  before_create :confirm_skip

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
#  authenticates_with_sorcery!

=begin
  include Mongoid::Document
  include Mongoid::Timestamps

  field :username, type: String
  field :email, type: String
  field :crypted_password, type: String, default: nil
  field :salt, type: String, default: nil
  field :user_type, type: Integer
=end

=begin
  # UserActivity
  field :last_login_at, type: DateTime, defualt: nil
  field :last_logout_at, type: DateTime, defualt: nil
  field :last_activity_at, type: DateTime, defualt: nil
  field :last_login_from_ip_address, type: String, defualt: nil

  #BrouteForceDetect
  field :failed_logins_count, type: Integer, default: 0
  field :lock_expires_at, type: DateTime, defualt: nil
  field :unlock_token, type: String, default: nil


#  EXTERNAL
#  create_table :authentications do |t|
#    t.integer :user_id, :null => false
#    t.string :provider, :uid, :null => false
#    t.timestamps
#  end
#



  def self.get_current_users
    config = sorcery_config

    where(config.last_activity_at_attribute_name.ne => nil) \
      .where("this.#{config.last_logout_at_attribute_name} == null
      || this.#{config.last_activity_at_attribute_name} > this.#{config.last_logout_at_attribute_name}") \
      .where(config.last_activity_at_attribute_name.gt => config.activity_timeout.seconds.ago.utc).order_by([:_id,:asc])

  end
=end

  def confirm_skip
     self.skip_confirmation!
  end

end
