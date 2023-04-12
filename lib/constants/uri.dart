String baseNeumTechURL = 'http://customer_server.maharah.neumtech.net/api/';

Map<String, String> defaultAuthenticatedHeader(String token) {
  return {'Authorization': 'Bearer $token'};
}