
get '/ethnicity/all' do
  
  erb :"ethnicity_views/all"
end

get '/ethnicity/show/:id' do
  @ethnic = Ethnicity.find(params[:id])
  erb :"ethnicity_views/show"
end

get '/ethnicity/edit/:id' do
  
  erb :"ethnicity_views/edit"
end 

get '/ethnicity/delete/:id' do
  
  erb :"ethnicity_views/delete"
end

post '/ethnicity/new' do
  new_object = Ethnicity.new(params[ethnicity])
  if new_object.save
    redirect to("/ethnicity_views/all")
  else
    @errors = ethnicity.errors.messages
    erb :"ethnicity_views/new"
  end
end

post '/ethnicity/edit' do
  edit_object = Ethnicity.find(params[:ethnicity_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

post '/ethnicity/delete' do
  ethnicity = Ethnicity.find( )
  ethnicity.destroy
  redirect to('/')
end

