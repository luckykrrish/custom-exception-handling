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
    flash[:notice] = I18n.t(translate_string_for(exception))
    exception_file = "#{RAILS_ROOT}/exception_log.txt"
    File.open(exception_file, 'a') {|f| f.write(exception.message + "\n" + exception.backtrace.join("\n")) }
    redirect_to posts_path
  end

  def translate_string_for(exception)
    t_string = exception.class.to_s.underscore.gsub(%r|/|, '.')
    return "exception_messages.#{t_string}"
  end
end
