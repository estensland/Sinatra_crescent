
get '/life_event/new/:id' do
  
  erb :"life_event_views/new"
end

get '/life_event/show/:id' do
  
  erb :"life_event_views/show"
end

get '/life_event/edit/:id' do
  
  erb :"life_event_views/edit"
end 

get '/life_event/delete/:id' do
  
  erb :"life_event_views/delete"
end

post '/life_event/new' do
  new_object = LifeEvent.new(params[life_event])
  if new_object.save
    redirect to("/life_event_views/all")
  else
    @errors = life_event.errors.messages
    erb :"life_event_views/new"
  end
end

post '/life_event/edit' do
  edit_object = LifeEvent.find(params[:life_event_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

post '/life_event/delete' do
  life_event = LifeEvent.find( )
  life_event.destroy
  redirect to('/')
end

