enum Environment {dev, staging, prod}

class Constants{
  static Map<String, dynamic> _config =_Config.debugConstants;

  static void setEnvironment(Environment environment){
    switch(environment){
      case Environment.dev:
        _config=_Config.debugConstants;
        break;
      case Environment.staging:
        _config=_Config.stagingConstants;
        break;
      case Environment.prod:
        _config=_Config.prodConstants;
        break;
    }
  }

  static get serverOne {
    return _config[_Config.serverOne];
  }
  static get serverTwo {
    return _config[_Config.serverTwo];
  }
  static get envName {
    return _config[_Config.envName];
  }
}

class _Config {
  static const serverOne = "SERVER_ONE";
  static const serverTwo = "SERVER_TWO";
  static const envName = "ENVIRONMENT_NAME";

  static Map<String, dynamic> debugConstants = {
    serverOne : "localhost:3000/",
    serverTwo : "localhost:8000/",
    envName : "Dev",
  };
  static Map<String, dynamic> stagingConstants = {
    serverOne : "https://staging1.example.com",
    serverTwo : "https://staging2.example.com",
    envName : "Staging",

  };
  static Map<String, dynamic> prodConstants = {
    serverOne : "https://prod1.example.com",
    serverTwo : "https://prod2.example.com",
    envName : "Prod",
  };
}