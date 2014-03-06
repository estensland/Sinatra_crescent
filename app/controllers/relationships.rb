
get '/relationship/new/:id' do
  
  erb :"relationship_views/new"
end

get '/relationship/show/:id' do
  
  erb :"relationship_views/show"
end

get '/relationship/edit/:id' do
  
  erb :"relationship_views/edit"
end 

get '/relationship/delete/:id' do
  
  erb :"relationship_views/delete"
end

post '/relationship/new' do
  new_object = Relationship.new(params[relationship])
  if new_object.save
    redirect to("/relationship_views/all")
  else
    @errors = relationship.errors.messages
    erb :"relationship_views/new"
  end
end

post '/relationship/edit' do
  edit_object = Relationship.find(params[:relationship_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

post '/relationship/delete' do
  relationship = Relationship.find( )
  relationship.destroy
  redirect to('/')
end

