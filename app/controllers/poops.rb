post '/poops/new' do
  new_object = Poops.new(params[poops])
  if new_object.save
    redirect to("/poops_views/all")
  else
    @errors = poops.errors.messages
    erb :"poops_views/new"
  end
end

get '/poops/edit' do
  edit_object = Poops.find(params[:poops_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

get '/poops/delete' do
  poops = Poops.find( )
  poops.destroy
  redirect to('/')
end
