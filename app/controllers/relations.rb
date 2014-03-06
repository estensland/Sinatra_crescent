
get '/relation/new/:id' do
  
  erb :"relation_views/new"
end

get '/relation/show/:id' do
  
  erb :"relation_views/show"
end

get '/relation/edit/:id' do
  
  erb :"relation_views/edit"
end 

get '/relation/delete/:id' do
  
  erb :"relation_views/delete"
end

post '/relation/new' do
  new_object = Relation.new(params[relation])
  if new_object.save
    redirect to("/relation_views/all")
  else
    @errors = relation.errors.messages
    erb :"relation_views/new"
  end
end

post '/relation/edit' do
  edit_object = Relation.find(params[:relation_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

post '/relation/delete' do
  relation = Relation.find( )
  relation.destroy
  redirect to('/')
end

