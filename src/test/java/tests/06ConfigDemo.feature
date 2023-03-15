Feature: Config Demo

  Background:
    * print name
    * url baseURL
    * header Accept = 'application/json'


  Scenario: Config Demo 1
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response