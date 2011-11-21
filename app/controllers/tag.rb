Beats.controllers :tag, :parent => :beats do
  get :with do
    beat = Beat.find(params[:beat_id])
    beat.tags_array.concat(params[:tags].split)
    beat.save
    
    jsonp beat.tags_array
  end

end
