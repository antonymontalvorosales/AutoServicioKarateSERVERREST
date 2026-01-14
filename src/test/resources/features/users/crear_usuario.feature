Feature: Crear usuario en Serverest con diferentes datos

  Background:
    * url baseUrl

  @epic=Usuarios
  @feature=CRUD
  @severity=critical
  Scenario Outline: Crear usuario exitosamente con distintos datos
    * def uniqueEmail = '<prefix>' + java.util.UUID.randomUUID().toString().replaceAll('-', '') + '@qa.com.br'
    * karate.log('Generando email único para el usuario:', uniqueEmail)

    * def payload = { nome: '<nome>', email: '#(uniqueEmail)', password: '<password>', administrador: '<administrador>' }
    * karate.log('Datos enviados al servicio:', payload)

    Given path 'usuarios'
    And request payload
    When method POST
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'

    * karate.log('Usuario creado exitosamente con ID:', response._id)
    * karate.embed(response, 'application/json')

  Examples:
    | prefix   | nome            | password | administrador |
    | usuario1 | Usuario Test 1  | 123456   | true          |
    | usuario2 | Usuario Test 2  | 654321   | false         |
    | usuario3 | Usuario Test 3  | abc123   | true          |