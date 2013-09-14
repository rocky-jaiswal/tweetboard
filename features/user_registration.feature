Feature: User Registrations

  In order to have clean data
  As a application
  I want to check the validations for user

Scenario: Should allow saving a user when all required fields are entered
  Given I am on the application root page
  When I enter the email "dude@example.com"
  And I enter the password "D!ude1234"
  And I enter the password confirmation "D!ude1234"
  And I try to save the user
  Then I should see the home page

Scenario: Should not allow saving a user without an email
  Given I am on the application root page
  When I enter the email ""
  And I try to save the user
  Then I should see an error message

Scenario: Should not allow saving a user with a bad email
  Given I am on the application root page
  When I enter the email "dude"
  And I enter the password "Dude1234"
  And I enter the password confirmation "Dude1234"
  And I try to save the user
  Then I should see an error message
