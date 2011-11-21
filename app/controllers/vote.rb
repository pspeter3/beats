Beats.controllers :vote, :parent => :beats do
  get :up, :provides => :json do
    ip = Ip.find_or_create_by :addr => request.ip
    beat = Beat.find(params[:beat_id])
    ip.vote beat, :up
    
    jsonp beat.votes
  end
  
  get :down, :provides => :json do
    ip = Ip.find_or_create_by :addr => request.ip
    beat = Beat.find(params[:beat_id])
    ip.vote beat, :down
    
    jsonp beat.votes
  end
end
