Given /^I am an authenticated user$/ do
  Given "a user exists with username: \"John Polling\", email: \"john@theled.co.uk\""
	And "I am on the login page"
	When "I fill in \"Username\" with \"John Polling\""
	And "I fill in \"Password\" with \"password\""
	And "I press \"Login\""
	Then "I should be on the admin pages page"
	And "I should see \"Login successful!\""
end
