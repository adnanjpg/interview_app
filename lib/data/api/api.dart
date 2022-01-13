const String hostUrl = 'https://api.stackexchange.com',
    apiVersion = '2.3',
    siteName = 'stackoverflow';

String getFullDomain() {
  return [hostUrl, apiVersion].join('/');
}
