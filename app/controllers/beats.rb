Beats.controllers :beats do
  get :index, :provides => :json do
    result = {}
    result[:page] = current_page
    result[:count] = Beat.count
    result[:beats] = Beat.paginate(result[:page])
    case params[:sort]
      when 'timestamp'
        result[:sort] = 'timestamp'
        result[:beats] = result[:beats].desc('timestamp')
      when 'points'
        result[:sort] = 'points'
        result[:beats] = result[:beats].desc('votes.point')
      else
        puts 'uid'
        result[:sort] = 'uid'
        result[:beats] = result[:beats].desc('uid')
    end
    
    jsonp result
  end

  get :show, :map => '/beats/:id', :provides => :json do
    beat = Beat.find params[:id]
    
    jsonp beat
  end
end
