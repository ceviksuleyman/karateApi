@test01
Feature: Sample API Tests

  Scenario: Test a Sample GET API
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200


    # com.intuit.karate
    # karate-archetype 1.0.0