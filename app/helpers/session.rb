def current_user
  session[:user]
end

def set_user(name, id)
  session[:user] = name
  session[:user_id] = id
end

def current_user_id
  session[:user_id]
end

def clear_user
  set_user(nil, nil)
end