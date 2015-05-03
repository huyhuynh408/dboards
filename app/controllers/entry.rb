include FileUtils::Verbose
require 'fileutils'


#create
get '/upload' do
  @cohorts    = Cohort.all
  @languages  = Language.all
  @phases     = Phase.all
  erb :'entry/upload'
end

post '/upload' do
  user_id     = current_user_id
  phase_id    = Phase.find_by_name(params[:phase]).id
  cohort_id   = Cohort.find_by_name(params[:cohort]).id
  language_id = Language.find_by_name(params[:language]).id

  if params[:file]
    entry = Entry.create(params[:entry])
    entry.update_attributes(phase_id:    phase_id, \
                            cohort_id:   cohort_id, \
                            user_id:     user_id \
                           )

    Coding.create(entry_id: entry.id, language_id: language_id)

    FileUtils::mkdir_p "public/uploads/#{entry.id}"

    @tempfile = params[:file][:tempfile]
    @filename = params[:file][:filename]
    cp(@tempfile.path, "public/uploads/#{entry.id}/#{@filename}")

    redirect("/entry/#{entry.id}")
  else
    "no file selected"
  end
end

#read
get '/entry/:id' do
  @entry = Entry.find_by_id(params[:id])
  erb :'entry/show'
end

get '/entry/picture/:id' do
  @entry = Entry.find_by_id(params[:id])
  erb :'entry/picture'
end

#update
get '/edit/:id' do
  @entry = Entry.find_by_id(params[:id])
  @cohorts    = Cohort.all
  @languages  = Language.all
  @phases     = Phase.all

  if current_user == @entry.user.name
    erb :'entry/edit'
  else
    erb :'entry/error'
  end
end

put '/edit' do
  "Hello World"
end

#delete
delete '/delete/:id' do
  Entry.find_by_id(params[:id]).destroy
  redirect("/")
end