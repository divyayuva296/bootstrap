module DeviseHelper
	def devise_error_messages!
		messages = resource.errors.details.keys.map { |attr|      content_tag(:li, resource.errors.full_messages_for(attr).first) }.join
		# messages = resource.errors.full_messages.map { |map| content_tag(:li, msg)}.join
	end
end
