include FileUtils::Verbose
require 'fileutils'


#upload
get '/upload' do
  @cohorts = Cohort.all
  @languages = Language.all
  @phases = Phase.all
  erb :'entry/upload'
end

post '/upload' do

  phase_id = Phase.find_by_name(params[:phase])

  if params[:file]
    entry = Entry.create(params[:entry])

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