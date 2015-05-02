get '/user' do
  "Hello World"
end

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

get '/login' do
  erb :'user/login'
end

post '/login' do
  @user = User.find_by_email(params[:email])
  redirect("/login") if @user == nil
  if @user.password == params[:password]
    redirect("/user")
  else
    redirect("/login")
  end
end

get '/logout' do
  "Hello World"
end