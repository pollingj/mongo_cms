Feature: User Authentication


Scenario: User can successfully login
	Given I am an authenticated user
	
Scenario: User can fail login with incorrect password
	Given a user exists with username: "John Polling", email: "john@theled.co.uk"
	And I am on the login page
	When I fill in "Username" with "John Polling"
	And I fill in "Password" with "incorrect"
	And I press "Login"
	Then I should see "Login"
	And I should see "Incorrect login details!"
	
Scenario: User can fail login with incorrect username
	Given a user exists with username: "John Polling", email: "john@theled.co.uk"
	And I am on the login page
	When I fill in "Username" with "John"
	And I fill in "Password" with "password"
	And I press "Login"
	Then I should see "Login"
	And I should see "Incorrect login details!"
	
Scenario: Unauthenticated user cannot access pages
	Given I am on the admin pages page
	Then I should be on the login page
	And I should see "You must be logged in to access this page"
	
Scenario: User can successfully login and redirect to the page they tried to access (assets)
	Given a user exists with username: "John Polling", email: "john@theled.co.uk"
	And I am on the admin assets page #user not authenticated yet
	When I fill in "Username" with "John Polling"
	And I fill in "Password" with "password"
	And I press "Login"
  Then I should be on the admin assets page
  And I should see "Login successful!"