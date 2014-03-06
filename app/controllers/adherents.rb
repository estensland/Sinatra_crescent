
get '/adherent/new/:id' do
  
  erb :"adherent_views/new"
end

get '/adherent/show/:id' do
  
  erb :"adherent_views/show"
end

get '/adherent/edit/:id' do
  
  erb :"adherent_views/edit"
end 

get '/adherent/delete/:id' do
  
  erb :"adherent_views/delete"
end

post '/adherent/new' do
  new_object = Adherent.new(params[adherent])
  if new_object.save
    redirect to("/adherent_views/all")
  else
    @errors = adherent.errors.messages
    erb :"adherent_views/new"
  end
end

post '/adherent/edit' do
  edit_object = Adherent.find(params[:adherent_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

post '/adherent/delete' do
  adherent = Adherent.find( )
  adherent.destroy
  redirect to('/')
end

