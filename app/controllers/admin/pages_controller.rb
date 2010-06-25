class Admin::PagesController < Admin::CmsApplicationController
  inherit_resources
  
  def create
    create!(:notice => "Page created successfully!", :alert => "Page creation failed!") do |success, failure|
      success.html { redirect_to admin_pages_path }
      failure.html { render :action => :new }
    end
  end
end
