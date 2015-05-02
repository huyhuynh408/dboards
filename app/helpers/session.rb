def current_user
  session[:user]
end

def set_user(name)
  session[:user] = name
end