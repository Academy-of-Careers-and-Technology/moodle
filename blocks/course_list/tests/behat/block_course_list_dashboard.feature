@block @block_course_list
Feature: Enable the course_list block on the dashboard and view it's contents
  In order to enable the course list block on the dashboard
  As a user
  I can add the course list block to the dashboard

  Background:
    Given the following "categories" exist:
      | name        | category | idnumber |
      | Category A  | 0        | CATA     |
      | Category B  | 0        | CATB     |
      | Category C  | CATB     | CATC     |
    And the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1        | 0        |
      | Course 2 | C2        | CATA     |
      | Course 3 | C3        | CATB     |
      | Course 4 | C4        | CATC     |
    And the following "users" exist:
      | username | firstname | lastname | email                |
      | teacher1 | Teacher   | First    | teacher1@example.com |
    And the following "course enrolments" exist:
      | user | course | role           |
      | teacher1 | C1 | editingteacher |
      | teacher1 | C2 | editingteacher |
      | teacher1 | C3 | editingteacher |

  Scenario: Add the course list block on the dashboard and navigate to the course listing
    Given I log in as "teacher1"
    And I press "Customise this page"
    When I add the "Courses" block
    Then I should see "Course 1" in the "My courses" "block"
    And I should see "Course 2" in the "My courses" "block"
    And I should see "Course 3" in the "My courses" "block"
    And I should not see "Course 4" in the "My courses" "block"
    And I follow "All courses"
    And I should see "Category 1"

  Scenario: Add the course list block on the dashboard and navigate to another course
    Given I log in as "teacher1"
    And I press "Customise this page"
    When I add the "Courses" block
    Then I should see "Course 1" in the "My courses" "block"
    And I should see "Course 2" in the "My courses" "block"
    And I should see "Course 3" in the "My courses" "block"
    And I should not see "Course 4" in the "My courses" "block"
    And I am on "Course 3" course homepage
    And I should see "Course 3"

  Scenario: Add the course list block on the dashboard and view as an admin
    Given I log in as "admin"
    And I press "Customise this page"
    When I add the "Courses" block
    Then I should see "Category 1" in the "Course categories" "block"
    And I should see "Category A" in the "Course categories" "block"
    And I should see "Category B" in the "Course categories" "block"
    And I should not see "Category C" in the "Course categories" "block"
    And I should not see "Course 1" in the "Course categories" "block"
    And I should not see "Course 2" in the "Course categories" "block"
    And I follow "All courses"
    And I should see "Category 1"
