module PeopleHelper

  def up_down_arrow(order) 
    params[:order] == order ? (['ASC', ''].include?(params[:asc]) ? "&uarr;" : "&darr;") : ""
  end

end
