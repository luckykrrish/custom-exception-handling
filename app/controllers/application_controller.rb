# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def local_request?
    false
  end

  private

  def rescue_action_in_public(exception)
    begin
      p I18n.t(translate_string_for(exception))
      flash.now[:notice] = I18n.t!(translate_string_for(exception))
      render :partial => 'shared/error'
    rescue I18n::MissingTranslationData
      super
    ensure
      EXCEPTION_LOGGER.info(exception.message)
      EXCEPTION_LOGGER.info(exception.backtrace.join("\n"))
    end
  end

  def translate_string_for(exception)
    t_string = exception.class.to_s.underscore.gsub(%r|/|, '.')
    return "exception_messages.#{t_string}"
  end
end
