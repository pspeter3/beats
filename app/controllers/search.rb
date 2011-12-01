Beats.controllers :search do
  get :index, :provides => :json do
    result = {}
    result[:page] = current_page
    result[:count] = Beat.fulltext_search(params[:q]).count
    result[:beats] = Beat.paginate(result[:page]).fulltext_search(params[:q])
    
    jsonp result
  end

end
