class Admin::UserSessionsController < InheritedResources::Base
  actions :new, :create, :destroy
  
  layout "admin/application"
  
  
  def create
    create!(:notice => "Login successful!", :alert => "Incorrect login details!") do |success, failure|
      success.html { redirect_back_or_default admin_pages_path }
      failure.html { render :action => :new }
    end
  end
  
  private
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end
