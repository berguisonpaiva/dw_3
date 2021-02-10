import 'dart:io';

import 'package:shelf/shelf.dart';

const _defaultCorsHeader = {
  'Access-Control_Allow-Origin': '*',
  'Access-Control_Allow-Methods': 'GET, POST, PATCH, PUT, DELETE, OPTIONS',
  'Access-Control_Allow-Header':
      '${HttpHeaders.contentTypeHeader},${HttpHeaders.authorizationHeader}',
};

//interceptos tipos de requisição GET, POST, PATCH, PUT, DELETE, OPTIONS
Middleware cors({Map<String, String> headers = _defaultCorsHeader}) {
  return (Handler innerHandler) {
    return (Request request) async {
      if (request.method == 'OPTIONS') {
        return Response(HttpStatus.ok, headers: headers);
      }
      final mapHeader = {...request?.headers, ...headers};
      final response = await innerHandler(request.change(headers: mapHeader));
      return response.change(headers: headers);
    };
  };
}

//interceptos json
Middleware defaultResponseContentType(String contentType) {
  return (Handler innerHandler) {
    return (Request request) async {
      final response = await innerHandler(request);
      final mapHeader = {
        ...request?.headers ?? {},
        'content-type': contentType
      };
      return response?.change(headers: mapHeader) ?? Response.notFound('');
    };
  };
}
