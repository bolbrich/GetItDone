class ApplicationController < ActionController::Base

  protect_from_forgery
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  public
  
  # rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  # private

  # def record_not_found
	# render :template => "404.html.erb", :status => 404
  # end
  
  def rescue_action_in_public(exception)
  set_meta("robots","noindex")
  case exception
     when ::ActiveRecord::RecordNotFound
     when ::ActiveRecord::RecordInvalid
     when ::ActionController::RoutingError
     when ::ActionController::UnknownController
     when ::ActionController::UnknownAction
     when ::ActionController::MethodNotAllowed
       render :template => "404.html.erb", :status => 404
     else
       render :template => "500.html.erb", :status => 500
   end
end
  
end
