
get '/title/new/:id' do
  
  erb :"title_views/new"
end

get '/title/show/:id' do
  
  erb :"title_views/show"
end

get '/title/edit/:id' do
  
  erb :"title_views/edit"
end 

get '/title/delete/:id' do
  
  erb :"title_views/delete"
end

post '/title/new' do
  new_object = Title.new(params[title])
  if new_object.save
    redirect to("/title_views/all")
  else
    @errors = title.errors.messages
    erb :"title_views/new"
  end
end

post '/title/edit' do
  edit_object = Title.find(params[:title_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

post '/title/delete' do
  title = Title.find( )
  title.destroy
  redirect to('/')
end

