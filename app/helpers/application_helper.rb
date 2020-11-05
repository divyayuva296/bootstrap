module ApplicationHelper
	def sortable(column, title = nil)
  		title ||= column.titleize
  		css_class = column == sort_column ? "current #{sort_direction}" : nil
  		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  		link_to title, {:sort => column, :direction => direction}, {:class => css_class}
	end

	def show_errors(object, field_name)
  		if object.errors.any?
    		if !object.errors.messages[field_name].blank?
      			object.errors.messages[field_name].join(", ")
    		end
  		end
	end 

end
