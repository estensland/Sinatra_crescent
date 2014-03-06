
get '/description/new/:id' do
  
  erb :"description_views/new"
end

get '/description/show/:id' do
  
  erb :"description_views/show"
end

get '/description/edit/:id' do
  
  erb :"description_views/edit"
end 

get '/description/delete/:id' do
  
  erb :"description_views/delete"
end

post '/description/new' do
  new_object = Description.new(params[description])
  if new_object.save
    redirect to("/description_views/all")
  else
    @errors = description.errors.messages
    erb :"description_views/new"
  end
end

post '/description/edit' do
  edit_object = Description.find(params[:description_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

post '/description/delete' do
  description = Description.find( )
  description.destroy
  redirect to('/')
end

