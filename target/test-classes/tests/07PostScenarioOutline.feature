Feature: Demo data driven testing

  Background:
    * url baseURL

  Scenario Outline: Post demo
    Given path '/users'
    And request {"name": <firstname>, "job": <job>}
    When method POST
    Then status 201
    And print response
    And print response.name
    And match response.name == <firstname>

    Examples:
      | firstname    | job          |
      | "Java"       | QA-Tester    |
      | "Javascript" | TestEngineer |