Beats.controllers :tags do
  get :index, :provides => :json do
    tags = Beat.tags_with_weight.map do |tag|
      {:tag => tag[0], :weight => tag[1]}
    end
    
    jsonp tags
  end

  get :show, :map => '/tags/:tag', :provides => :json do
    result = {}
    result[:page] = current_page
    result[:count] = Beat.tagged_with(params[:tag]).count
    result[:beats] = Beat.tagged_with(params[:tag]).paginate(result[:page])
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
end
