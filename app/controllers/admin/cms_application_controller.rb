class Admin::CmsApplicationController < ApplicationController
  before_filter :require_user
  helper_method :current_user_session, :current_user
  
  layout "admin/application"
  
  private
     def current_user_session
       return @current_user_session if defined?(@current_user_session)
       @current_user_session = UserSession.find
     end

     def current_user
       return @current_user if defined?(@current_user)
       @current_user = current_user_session && current_user_session.record
     end

     def require_user
       unless current_user
         store_location
         flash[:notice] = "You must be logged in to access this page"
         redirect_to new_admin_user_session_url
         return false
       end
     end

     def store_location
       session[:return_to] = request.request_uri
     end
end