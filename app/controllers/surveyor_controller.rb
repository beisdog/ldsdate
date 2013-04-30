# encoding: UTF-8
module SurveyorControllerCustomMethods 
  def self.included(base)
    base.send :before_filter, :require_user   # AuthLogic
    base.send :before_filter, :login_required  # Restful Authentication
    base.send :layout, 'surveyor_custom'
  end

  # Actions
  def new
    @surveys = Survey.find(:all)
    @codes = @surveys.inject({}) do |codes,s|
      codes[s.access_code] ||= {}
      codes[s.access_code][:title] = s.title
      codes[s.access_code][:survey_versions] ||= []
      codes[s.access_code][:survey_versions] << s.survey_version
      codes
    end
    @title = "You can take these surveys"

    @response_sets = ResponseSet.where( :user_id => current_user.id )
    redirect_to surveyor_index unless surveyor_index == available_surveys_path


  end
  def create
    super
  end
  def show
    super
  end
  def edit
    super
  end
  def update
    super
  end

  # Paths
  def surveyor_index
    # most of the above actions redirect to this method
    super # available_surveys_path
  end
  def surveyor_finish
    # the update action redirects to this method if given params[:finish]
    super # available_surveys_path
  end
end
class SurveyorController < BaseController
  include Surveyor::SurveyorControllerMethods
  include SurveyorControllerCustomMethods
end
