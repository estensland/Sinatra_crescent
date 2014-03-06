
get '/classical_muslim/new/:id' do
  
  erb :"classical_muslim_views/new"
end

get '/classical_muslim/show/:id' do
  
  erb :"classical_muslim_views/show"
end

get '/classical_muslim/edit/:id' do
  
  erb :"classical_muslim_views/edit"
end 

get '/classical_muslim/delete/:id' do
  
  erb :"classical_muslim_views/delete"
end

post '/classical_muslim/new' do
  new_object = ClassicalMuslim.new(params[classical_muslim])
  if new_object.save
    redirect to("/classical_muslim_views/all")
  else
    @errors = classical_muslim.errors.messages
    erb :"classical_muslim_views/new"
  end
end

post '/classical_muslim/edit' do
  edit_object = ClassicalMuslim.find(params[:classical_muslim_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

post '/classical_muslim/delete' do
  classical_muslim = ClassicalMuslim.find( )
  classical_muslim.destroy
  redirect to('/')
end

