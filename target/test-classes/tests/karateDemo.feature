Feature: CRUD in Karate Framework

  Background:
    * url 'https://reqres.in/'

  @get
  Scenario: Get second user
    Given path 'api/users/2'
    When method GET
    Then status 200
    And print response
    * assert response.data.id == 2


  @post
  Scenario: Post user information
    Given path 'api/users'
    * def data =
      """
      {
      "last_name": " ",
      "id": ,
      "avatar": " ",
      "first_name": "Mars",
      "email": " "
    }
        """
    Then request data
    When method POST
    Then status 201
    And print response
    And match $ contains {first_name:'Mars'}
    * match  $.first_name == 'Mars'
    * match $ contains {id: #notnull}


  @put
  Scenario: Update third user's first name
    Given path 'api/users/3'
    * def data =
      """
      {
      "last_name": " ",
      "id": ,
      "avatar": " ",
      "first_name": "Jupiter",
      "email": " "
    }
        """
    Then request data
    When method PUT
    Then status 200
    And print response
    And match $ contains {first_name:'Jupiter'}
    * match $.first_name == 'Jupiter'


  @delete
  Scenario: Delete second user's information
    Given url baseURLDelete
    When method DELETE
    Then status 204
    And print response