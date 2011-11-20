Beats.controllers :tags do
  get :index, :provides => :json do
    @tags = Beat.tags_with_weight.map do |tag|
      {:tag => tag[0], :weight => tag[1]}
    end
    
    render 'tags/index'
  end

  get :show do
  end
end
