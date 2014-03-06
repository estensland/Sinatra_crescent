
get '/ethnic_identity/new/:id' do
  
  erb :"ethnic_identity_views/new"
end

get '/ethnic_identity/show/:id' do
  
  erb :"ethnic_identity_views/show"
end

get '/ethnic_identity/edit/:id' do
  
  erb :"ethnic_identity_views/edit"
end 

get '/ethnic_identity/delete/:id' do
  
  erb :"ethnic_identity_views/delete"
end

post '/ethnic_identity/new' do
  new_object = EthnicIdentity.new(params[ethnic_identity])
  if new_object.save
    redirect to("/ethnic_identity_views/all")
  else
    @errors = ethnic_identity.errors.messages
    erb :"ethnic_identity_views/new"
  end
end

post '/ethnic_identity/edit' do
  edit_object = EthnicIdentity.find(params[:ethnic_identity_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

post '/ethnic_identity/delete' do
  ethnic_identity = EthnicIdentity.find( )
  ethnic_identity.destroy
  redirect to('/')
end

