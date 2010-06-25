Feature: Manage pages
	In order to manage site content
	As a Authenticated user 
	I want to be able to view, add, edit, delete and reorder pages

	Scenario: Display existing pages
		Given a page exists with title: "Home"
		And I am an authenticated user
		And I am on the admin pages page
		Then I should see "Home"
		
	Scenario: No pages to display
		Given I am an authenticated user
		And I am on the admin pages page
		Then I should see "No pages created!"

	@javascript
	Scenario: Add first new page
		Given I am an authenticated user
		And I am on the admin pages page
		When I follow "Add page"
		Then I should be on the new admin page page
		When I fill in "Title" with "Home Page"
		Then the "Slug" field should contain "home-page"
		When I press "Create page"
		Then I should be on the admin pages page
		And I should see "Page created successfully!"
		And I should see "Home"