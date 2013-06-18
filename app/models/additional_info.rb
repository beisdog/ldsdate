class AdditionalInfo < ActiveRecord::Base
  belongs_to :user
  belongs_to :body_type
  belongs_to :hair_color
  belongs_to :eyes_color
  belongs_to :relationship_status
  belongs_to :education
  belongs_to :attractiveness

  attr_accessible :user_id, :want_kids, :body_type_id, :height, :show_weight, :looks, :hair_color_id,
                  :eye_color_id, :attractiveness_id, :handicap, :show_handicap, :ward,
                  :stake, :relationship_status_id, :education_id, :occupation,
                  :university
end
