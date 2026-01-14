Feature: Eliminar usuario en Serverest con diferentes datos

  Background:
    * url baseUrl

  @epic=Usuarios
  @feature=CRUD
  @severity=critical
  Scenario Outline: Eliminar usuario exitosamente
    * def payload = { nome: '<nome>', email: '<email>', password: '<password>', administrador: '<administrador>' }
    * karate.log('Datos enviados al servicio para creación:', payload)

    Given path 'usuarios'
    And request payload
    When method POST
    Then status 201
    * def userId = response._id
    * karate.log('Usuario creado con ID:', userId)
    * karate.embed(response, 'application/json')

    Given path 'usuarios', userId
    When method DELETE
    Then status 200
    And match response.message == 'Registro excluído com sucesso'
    * karate.log('Usuario eliminado correctamente:', response)
    * karate.embed(response, 'application/json')

    Examples:
      | nome           | email                | password | administrador |
      | Usuario Del 1  | delete1@test.com     | 123456   | true          |
      | Usuario Del 2  | delete2@test.com     | 654321   | false         |