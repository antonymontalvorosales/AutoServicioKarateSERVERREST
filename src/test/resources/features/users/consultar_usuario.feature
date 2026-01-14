Feature: Consultar usuario en Serverest con diferentes datos

  Background:
    * url baseUrl

  @epic=Usuarios
  @feature=CRUD
  @severity=critical
  Scenario Outline: Consultar usuario creado
    * def uniqueEmail = '<prefix>' + java.util.UUID.randomUUID().toString().replaceAll('-', '') + '@qa.com.br'
    * karate.log('Generando email único para el usuario:', uniqueEmail)

    * def payload = { nome: '<nome>', email: '#(uniqueEmail)', password: '<password>', administrador: '<administrador>' }
    * karate.log('Datos enviados al servicio para creación:', payload)

    Given path 'usuarios'
    And request payload
    When method POST
    Then status 201
    * def userId = response._id
    * karate.log('Usuario creado con ID:', userId)
    * karate.embed(response, 'application/json')

    Given path 'usuarios', userId
    When method GET
    Then status 200
    And match response._id == userId
    And match response.nome == '<nome>'
    And match response.email == '#(uniqueEmail)'
    * karate.log('Usuario consultado correctamente:', response)
    * karate.embed(response, 'application/json')

    Examples:
      | prefix    | nome            | password | administrador |
      | consulta1 | Usuario Test A  | 123456   | true          |
      | consulta2 | Usuario Test B  | 654321   | false         |