def current_user
  session[:user]
end

def set_user(name)
  session[:user] = name
end

def current_user_id
  session[:user_id]
end

def set_user_id(id)
  session[:user_id] = id
end