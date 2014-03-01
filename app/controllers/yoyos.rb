post '/yoyos/new' do
  new_object = Yoyos.new(params[yoyos])
  if new_object.save
    redirect to("/yoyos_views/all")
  else
    @errors = yoyos.errors.messages
    erb :"yoyos_views/new"
  end
end

get '/yoyos/edit' do
  edit_object = Yoyos.find(params[:yoyos_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

get '/yoyos/delete' do
  yoyos = Yoyos.find( )
  yoyos.destroy
  redirect to('/')
end
