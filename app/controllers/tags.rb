Beats.controllers :tags do
  get :index, :provides => :json do
    @tags = Beat.tags_with_weight.map do |tag|
      {:tag => tag[0], :weight => tag[1]}
    end
    
    jsonp @tags
  end

  get :show, :map => '/tags/:tag', :provides => :json do
    @tags = Beat.tagged_with params[:tag]
    
    jsonp @tags
  end
end
