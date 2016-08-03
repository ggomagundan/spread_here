Warden::Manager.after_set_user do |user, auth, opts|
  auth.cookies.signed[:user_id] = user.id
  # auth.cookies.signed[:user_expires_at] = 30.minutes.from_now
end

Warden::Manager.before_logout do |user, auth, opts|
  auth.cookies.signed[:user_id] = nil
  # auth.cookies.signed[:user_expires_at] = nil
end
