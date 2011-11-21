Beats.controllers :comment, :parent => :beats do
  get :new do
    beat = Beat.find(params[:beat_id])
    comment = Comment.new(:name => params[:name], :body => params[:body])
    beat.comments << comment if comment.errors.size == 0
    
    jsonp comment.errors
  end
end
