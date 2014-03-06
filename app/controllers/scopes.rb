
get '/scope/new/:id' do
  
  erb :"scope_views/new"
end

get '/scope/show/:id' do
  
  erb :"scope_views/show"
end

get '/scope/edit/:id' do
  
  erb :"scope_views/edit"
end 

get '/scope/delete/:id' do
  
  erb :"scope_views/delete"
end

post '/scope/new' do
  new_object = Scope.new(params[scope])
  if new_object.save
    redirect to("/scope_views/all")
  else
    @errors = scope.errors.messages
    erb :"scope_views/new"
  end
end

post '/scope/edit' do
  edit_object = Scope.find(params[:scope_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

post '/scope/delete' do
  scope = Scope.find( )
  scope.destroy
  redirect to('/')
end

