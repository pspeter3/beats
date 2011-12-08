Beats.controllers :beats do
  get :index, :provides => :json do
    result = {}
    result[:page] = current_page
    result[:count] = Beat.count
    if params[:crime] != nil
      if params[:location] != nil
        result[:beats] = Beat.where(:crime => params[:crime], :location => params[:location])
      else
        result[:beats] = Beat.where(:crime => params[:crime])
      end
    else
      result[:beats] = Beat
    end
    result[:beats] = result[:beats].paginate(result[:page])
    case params[:sort]
      when 'points'
        result[:sort] = 'points'
        result[:beats] = result[:beats].desc('votes.point')
      else
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
