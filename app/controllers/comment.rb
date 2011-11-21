Beats.controllers :comment do
  get :new, :map => '/beats/:id/comment' do
    @beat = Beat.find(params[:id])
    @comment = Comment.new(:name => params[:name], :body => params[:body])
    @beat.comments << @comment if @comment.errors.size == 0
    
    jsonp @comment.errors
  end
end
