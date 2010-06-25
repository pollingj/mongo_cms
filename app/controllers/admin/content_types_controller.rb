class Admin::ContentTypesController < Admin::CmsApplicationController
  inherit_resources
  
  def create
    create!(:notice => "Content type created successfully!", :alert => "Content type creation failed!") do |success, failure|
      success.html { redirect_to admin_content_types_path }
      failure.html { render :action => :new }
    end
  end
end
