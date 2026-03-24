import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiImpl {

    final Dio _http = Dio( BaseOptions( baseUrl: dotenv.env['ENDPOINT_API'] ?? '' ) );

    Future<String> getPromptResponse( String prompt ) async {
      try {
        final body = { 'prompt' : prompt };
        final response = await _http.post('/basic-prompt', data: jsonEncode(body) );
        return response.data;
      } catch (e) {
        throw Exception('Hubo algun error no esperado');
      }
    }

    Stream<String> getResponseStream( String prompt ) async* {
      final body = jsonEncode({ 'prompt' : prompt });
      final response = await _http.post(
        '/basic-prompt-stream',
        data:body,
        options: Options( responseType: ResponseType.stream)
      );

      final stream = response.data.stream as Stream<List<int>>;
      String buffer = '';

      await for( final chunk in stream ) {
        final chunkString = utf8.decode( chunk, allowMalformed:true );
        buffer += chunkString;
        yield buffer;
      }
    }

}