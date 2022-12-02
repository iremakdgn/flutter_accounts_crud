const bool isProduction = bool.fromEnvironment('dart.vm.product');

const developmentConfig = {
  'applicationId': 'neyasis.case.test',
  'applicationName': 'Neyasis Test',
  'apiBaseUrl': 'https://638767d8d9b24b1be3ef7ad0.mockapi.io/api/',
  'versionName': '1.0.0',
  'versionCode': '1'
};

const uatConfig = {
  'applicationId': 'neyasis.case.uat',
  'applicationName': 'Neyasis UAT',
  'apiBaseUrl': 'https://638767d8d9b24b1be3ef7ad0.mockapi.io/api/)',
  'versionName': '2.0.0',
  'versionCode': '2'
};

const productionConfig = {
  'applicationId': 'neyasis.case',
  'applicationName': 'Neyasis',
  'apiBaseUrl': 'https://638767d8d9b24b1be3ef7ad0.mockapi.io/api/',
  'versionName': '3.0.0',
  'versionCode': '3'
};

final environment = isProduction ? productionConfig : developmentConfig;
