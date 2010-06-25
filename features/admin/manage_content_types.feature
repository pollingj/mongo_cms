Feature: Manage content type
	In order to manage content types
	As a Authenticated user 
	I want to be able to view, add, edit and delete content types

	Scenario: Display existing content types
		Given a content type exists with title: "News"
		And I am an authenticated user
		And I am on the admin content types page
		Then I should see "News"
		
	Scenario: No content types to display
		Given I am an authenticated user
		And I am on the admin content types page
		Then I should see "No content types created!"

	Scenario: Add new minimum content type
		Given I am an authenticated user
		And I am on the admin content types page
		When I follow "Add content type"
		Then I should be on the new admin content type page
		And I fill in "Title" with "News"
		And I press "Create content type"
		Then I should see "Content type created successfully!"
 		And I should see "News"
		And I should see "Add content block"
		
	Scenario: Edit content type title
		Given I am an authenticated user
		And a content type exists with title: "Events"
		And I am on the admin content types page
		When I follow "Edit"
		Then the "Title" field should contain "Events"
		When I fill in "Title" with "Special Events"
		And I press "Edit content type"
		Then I should be on the admin content types page
		And I should see "Content type updated successfully!"
		And I should see "Special Events"