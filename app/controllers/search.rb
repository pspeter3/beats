Beats.controllers :search do
  get :index, :provides => :json do
    @beats = Beat.fulltext_search params[:q]
    
    jsonp @beats
  end

end
