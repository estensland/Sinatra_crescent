post '/umbrellas/new' do
  new_object = Umbrellas.new(params[umbrellas])
  if new_object.save
    redirect to("/umbrellas_views/all")
  else
    @errors = umbrellas.errors.messages
    erb :"umbrellas_views/new"
  end
end

get '/umbrellas/edit' do
  edit_object = Umbrellas.find(params[:umbrellas_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

get '/umbrellas/delete' do
  umbrellas = Umbrellas.find( )
  umbrellas.destroy
  redirect to('/')
end
