module ApplicationHelper
  def auth_token
  auth_token = '<input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>" />'
  return  "#{auth_token.html_safe}"
  end


end
