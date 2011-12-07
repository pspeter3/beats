Beats.controllers :crimes do
  get :index do
    crimes = Crime.all
    
    jsonp crimes
  end

end
