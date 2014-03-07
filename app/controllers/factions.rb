
get '/faction/all' do
  
  erb :"faction_views/all"
end

get '/faction/show/:id' do
  @faction = Faction.find(params[:id])
  erb :"faction_views/show"
end

get '/faction/edit/:id' do
  
  erb :"faction_views/edit"
end 

get '/faction/delete/:id' do
  
  erb :"faction_views/delete"
end

post '/faction/new' do
  new_object = Faction.new(params[faction])
  if new_object.save
    redirect to("/faction_views/all")
  else
    @errors = faction.errors.messages
    erb :"faction_views/new"
  end
end

post '/faction/edit' do
  edit_object = Faction.find(params[:faction_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

post '/faction/delete' do
  faction = Faction.find( )
  faction.destroy
  redirect to('/')
end

