import 'package:dio/dio.dart';
import 'function.dart';

Dio dio() {
  var dio = Dio(BaseOptions(
      baseUrl: 'http://10.0.2.2:8000/api/',
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
      },
      responseType: ResponseType.json));

  dio.interceptors.add(InterceptorsWrapper(
    onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      //Ajoutez le token à l'en-tête de la requête si le token est disponible
      if (await doesTokenExist()) {
        String? authToken = await getAuthToken();
        options.headers['Authorization'] = 'Bearer $authToken';
      }
      return handler.next(options); // Continuez le flux de la requête
    },
  ));
  return dio;
}
