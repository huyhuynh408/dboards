include FileUtils::Verbose
require 'fileutils'


#upload
get '/upload' do
  erb :'entry/upload'
end

post '/upload' do
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
  erb :'entry/show'
end
