@TestAPI
Feature: Crear mascota API Pet Store

  Background:
    * url 'https://petstore.swagger.io/v2/'

  @id:1 @CA01 @CrearMascota
  Scenario Outline: T-API-CA1- Adicionar una Mascota
    * def nuevaMascota = read('classpath:../examples/data/crearMascota.json')
    Given path 'pet'
    And request nuevaMascota
    When method POST
    Then status 200
    And match response.name == "Pug_Luna"
    * def idPath = response.id
    * def nombre = response.name
    Examples:
      | idMascota | nombreMascota  |
      | 1        | Pug_Luna |
  @id: @CA02 @ConsultarMascota
  Scenario Outline: T-API-CA2- Consultar Mascota
    * def trama = call read("petStore.feature@CA01")
    Given path 'pet/' + trama.idPath
    When method GET
    Then status 200
    And match response.name == '<nombreMascota>'
    Examples:
      | nombreMascota |
      | Pug_Luna|

  @id:3 @ActualizarMascota @CA03
  Scenario Outline: T-API-CA3- Actualizar Mascota
    * def trama = call read("petStore.feature@CA01")
    * set trama.mascotaBody.name = '<nameDog>'
    * print trama.mascotaBody
    Given path 'pet'
    And request trama.mascotaBody
    When method PUT
    Then status 200
    And match response.name == '<nameDog>'
    * def idPath = response.id
    * def nombre = response.name
    Examples:
      |nameDog|
      |PugCarlino_Luna|

  @id: @CA04 @ConsultarMascotaModificada
  Scenario Outline: T-API-CA4- Consultar Mascota Modificada
    * def trama = call read("petStore.feature@CA03")
    Given path 'pet/' + trama.idPath
    When method GET
    Then status 200
    And match response.name == '<nombreMascota>'
    Examples:
      | nombreMascota |
      | PugCarlino_Luna|

  @id:5 @EliminarMascota @CA05
  Scenario: T-API-CA5- Eliminar Mascota
    * def trama = call read("petStore.feature@CA01")
    Given path 'pet/'+ trama.idPath
    When method DELETE
    Then status 200
    And match response.message == "1"