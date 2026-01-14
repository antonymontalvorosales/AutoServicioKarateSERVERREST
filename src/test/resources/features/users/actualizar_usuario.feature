Feature: Actualizar usuario en Serverest con diferentes datos

  Background:
    * url baseUrl

  @epic=Usuarios
  @feature=CRUD
  @severity=critical
  Scenario Outline: Actualizar usuario exitosamente
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

    * def usuario = { nome: '<nuevoNome>', email: '#(uniqueEmail)', password: '<password>', administrador: '<administrador>' }
    * karate.log('Preparando datos para actualización:', usuario)

    Given path 'usuarios', userId
    And request usuario
    When method PUT
    Then status 200
    And match response.message == 'Registro alterado com sucesso'
    * karate.log('Usuario actualizado correctamente:', response)
    * karate.embed(response, 'application/json')

  Examples:
    | prefix   | nome           | password | administrador | nuevoNome          |
    | update1  | Usuario Orig 1 | 123456   | true          | Usuario Atualizado |
    | update2  | Usuario Orig 2 | 654321   | false         | Usuario Atualizado |