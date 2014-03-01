post '/bobs/new' do
  new_object = Bobs.new(params[bobs])
  if new_object.save
    redirect to("/bobs_views/all")
  else
    @errors = bobs.errors.messages
    erb :"bobs_views/new"
  end
end

get '/bobs/edit' do
  edit_object = Bobs.find(params[:bobs_id])
  edit_object.update_attributes(params)
  redirect to('/')
end

get '/bobs/delete' do
  bobs = Bobs.find( )
  bobs.destroy
  redirect to('/')
end
