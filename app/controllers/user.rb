get '/signup' do
  erb :'user/signup'
end

post '/signup' do
  @user = User.new(params[:user])
  @user.password = params[:password]

  if @user.valid?
    @user.save!
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