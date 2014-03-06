
get '/position/new/:id' do
  
  erb :"position_views/new"
end

get '/position/show/:id' do
  
  erb :"position_views/show"
end

get '/position/edit/:id' do
  
  erb :"position_views/edit"
end 

get '/position/delete/:id' do
  
  erb :"position_views/delete"
end

post '/position/new' do
  new_object = Position.new(params[position])
  if new_object.save
    redirect to("/position_views/all")
  else
    @errors = position.errors.messages
    erb :"position_views/new"
  end
end

post '/position/edit' do
  edit_object = Position.find(params[:position_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

post '/position/delete' do
  position = Position.find( )
  position.destroy
  redirect to('/')
end

