# Methods added to this helper will be available to all templates in the application.
  module ApplicationHelper
    
    def role_options_for_select
      Role.find(:all)
    end

end
