# class Writing < ApplicationRecord
# end


class Writing < ApplicationRecord
    # Other model code...
  
    def to_param
      show_action? ? title.parameterize : id.to_s
    end
  
    private
  
    def show_action?
      # Check if the current action is 'show'
      controller&.action_name == 'show'
    end
  end
  