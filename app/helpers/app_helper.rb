Beats.helpers do
  def jsonp(data)
    json_data = data.to_json
    json_data = "#{params[:callback]}(#{json_data})"if params[:callback] != nil
    
    json_data
  end
  
  def current_page
    page = params[:page].to_i
    page = 1 if page < 1
    
    page
  end
end
