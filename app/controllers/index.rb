get '/' do
  @entries = Entry.all
  erb :index
end
