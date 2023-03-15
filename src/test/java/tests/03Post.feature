Feature: Post API Demo

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read("response1.json")

  # Simple Post Request
  Scenario: Post Demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "Cevik","job": "QA"}
    When method POST
    Then status 201
    And print response
    And match response.name =='Cevik'

    # Post with Background
  Scenario: Post Demo 2
    Given path '/users'
    And request {"name": "Suleyman","job": "QA"}
    When method POST
    Then status 201
    And print response
    And match response.name =='Suleyman'

    # Post with Assertions
  Scenario: Post Demo 3
    Given path '/users'
    And request {"name": "Suleyman","job": "QA"}
    When method POST
    Then status 201
    And match response == {"createdAt": "#ignore","name": "Suleyman","id": "#string","job": "QA"}
    And print response

    # Post with read response from file
  Scenario: Post Demo 4
    Given path '/users'
    And request {"name": "Suleyman","job": "QA"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

    # Post with read request body from file
  Scenario: Post Demo 5
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def filePath = projectPath+'/src/test/java/data/request1.json'
    And print filePath
    And def requestBody1 = filePath
    And request requestBody1
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response

    # Post with read response from file
  Scenario: Post Demo 6
    Given path '/users'
    And def reqBody = read("request1.json")
    And set reqBody.job = 'TestEngineer'
    And request reqBody
    When method POST
    Then status 201
    #And match response == expectedOutput
    And print response
