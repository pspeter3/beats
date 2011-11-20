Beats.controllers :comment, :parent => :beats do
  get :new do
    @beat = Beat.find(params[:beat_id])
    @data = {:beat => @beat}
    if @beat.comments.create(params[:comment])
      @data[:result] = "success"
    else
      @data[:result] = "failure"
    end
  
    jsonp @data
  end
end
