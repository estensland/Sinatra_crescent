post '/chinas/new' do
  new_object = Chinas.new(params[chinas])
  if new_object.save
    redirect to("/chinas_views/all")
  else
    @errors = chinas.errors.messages
    erb :"chinas_views/new"
  end
end

get '/chinas/edit' do
  edit_object = Chinas.find(params[:chinas_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

get '/chinas/delete' do
  chinas = Chinas.find( )
  chinas.destroy
  redirect to('/')
end
