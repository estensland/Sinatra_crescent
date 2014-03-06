
get '/event/new/:id' do
  
  erb :"event_views/new"
end

get '/event/show/:id' do
  
  erb :"event_views/show"
end

get '/event/edit/:id' do
  
  erb :"event_views/edit"
end 

get '/event/delete/:id' do
  
  erb :"event_views/delete"
end

post '/event/new' do
  new_object = Event.new(params[event])
  if new_object.save
    redirect to("/event_views/all")
  else
    @errors = event.errors.messages
    erb :"event_views/new"
  end
end

post '/event/edit' do
  edit_object = Event.find(params[:event_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

post '/event/delete' do
  event = Event.find( )
  event.destroy
  redirect to('/')
end

