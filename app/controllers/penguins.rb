post '/penguins/new' do
  new_object = Penguins.new(params[penguins])
  if new_object.save
    redirect to("/penguins_views/all")
  else
    @errors = penguins.errors.messages
    erb :"penguins_views/new"
  end
end

get '/penguins/edit' do
  edit_object = Penguins.find(params[:penguins_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

get '/penguins/delete' do
  penguins = Penguins.find( )
  penguins.destroy
  redirect to('/')
end
