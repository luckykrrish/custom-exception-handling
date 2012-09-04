# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  I18n.load_path = ['en.yml']
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def local_request?
    false
  end

  private

def rescue_action_in_public(exception)
  case exception
    when ActiveRecord::RecordNotFound, ActionController::UnknownAction, ActionController::RoutingError
      flash[:notice] = I18n.t( 'exception_messages.active_record.base.record_not_found' )
      redirect_to posts_path
    end
  end
end
