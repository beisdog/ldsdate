class EyesColor < ActiveRecord::Base
  attr_accessible :name

  has_one :additional_info
end
