function fn() {
  var env = karate.env;
  if (!env) {
    env = 'qa';
  }

  var config = {
    env: env,
    baseUrl: 'https://serverest.dev',
    headers: {
      'Content-Type': 'application/json'
    }
  };

  // Activar integración con Allure
  karate.configure('report', { showLog: true, showAllureReport: true });

  // Importar JavaFaker
  var Faker = Java.type('com.github.javafaker.Faker');
  var faker = new Faker();

  // Generar email único
  var uniqueEmail = faker.internet().emailAddress();

  // Variables globales
  config.usuarioPadrao = {
    nome: 'Antony Tester',
    email: uniqueEmail,
    password: '123456',
    administrador: 'true'
  };

  return config;
}