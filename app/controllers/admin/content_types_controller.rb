class Admin::ContentTypesController < Admin::CmsApplicationController
  inherit_resources
  
  def create
    create!(:notice => "Content type created successfully!", :alert => "Content type creation failed!") do |success, failure|
      failure.html { render :action => :new }
    end
  end
  
  def update
    update!(:notice => "Content type updated successfully!", :alert => "Content type update failed!") do |success, failure|
      success.html { redirect_to admin_content_types_path }
    end
  end
end
