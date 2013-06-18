class Preference < ActiveRecord::Base
  belongs_to :user
  attr_accessible :visible_to_others, :look_young_age, :look_old_age,
                  :hide_for_younger, :hide_for_older, :height, :smokes, :drinks,
                  :body_type, :body_type_importance, :hair_color,
                  :hair_color_importance, :ethnicity, :ethnicity_importance,
                  :partner_with_children, :look_for, :income, :income_importance,
                  :countries, :max_distance, :moving

end
