get '/signup' do
  erb :'user/signup'
end

post '/signup' do
  user = User.new(params[:user])
  password = params[:password_hash]

  if user.valid?
    user.save
    redirect("/user")
  else
    redirect("/signup")
  end
end

get '/user' do
  "Hello World"
end

get '/login' do
  "Hello World"
end

get '/logout' do
  "Hello World"
end