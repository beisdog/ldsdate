class UserSearchSetting < ActiveRecord::Base


  
  attr_accessible :age_from, :age_to, :country_ids, :height_cm_max, :height_cm_min, :show_females, :show_males, :show_only_only, :user_id, :zip,
    :ward,:stake
end
