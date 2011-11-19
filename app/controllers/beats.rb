Beats.controllers :beats do
  get :index, :provides => :json do
    page = params[:page].to_i || 1
    @beats = Beat.all
    
    render 'beats/index'
  end

  get :show, :map => '/beats/:id', :provides => :json do
    @beat = Beat.find params[:id]
    
    @beat.to_json
  end
end
