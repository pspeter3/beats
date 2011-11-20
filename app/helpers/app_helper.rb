Beats.helpers do
  def jsonp(data)
    json_data = data.to_json
    json_data = "#{params[:callback]}(#{json_data})"if params[:callback] != nil
    
    json_data
  end
end
