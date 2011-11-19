Beats.controllers :beats do
  get :index do
  end

  get :show, :map => '/beats/:id', :provides => :json do
    @beat = Beat.find params[:id]
    
    render 'beats/show'
  end
end
