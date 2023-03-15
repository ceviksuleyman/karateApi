Feature: Put API Demo

  Scenario: Put Demo 1
    Given url 'https://reqres.in/api/users/2'
    And request {"name": "Karate","job": "zion resident"}'
    When method POST
    Then status 201
    And print response