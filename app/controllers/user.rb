get '/user/:id' do
  @user = User.find_by_id(params[:id])
  if current_user == nil
    redirect('/login')
  else
    erb :'user/show'
  end
end

get '/signup' do
  erb :'user/signup'
end

post '/signup' do
  @user          = User.new(params[:user])
  @user.password = params[:password]

  if @user.valid?
    set_user(params[:user][:name], @user.id)
    @user.save!
    redirect("/user/#{@user.id}")
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
    set_user(@user.name, @user.id)
    redirect("/user/#{@user.id}")
  else
    redirect("/login")
  end
end

get '/logout' do
  clear_user
  redirect("/")
end