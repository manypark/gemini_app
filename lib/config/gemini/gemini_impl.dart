import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
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

    Stream<String> getResponseStream( String prompt, { List<XFile> files = const [] } ) async* {

      final formData = FormData();

      formData.fields.add( MapEntry('prompt', prompt) );

      if (files.isNotEmpty) {
        for (final file in files) {
          formData.files.add( MapEntry( 'files', await MultipartFile.fromFile(file.path, filename: file.name), ), );
        }
      }
      
      final response = await _http.post(
        '/basic-prompt-stream',
        data    : formData,
        options : Options( responseType: ResponseType.stream)
      );

      final stream = response.data.stream as Stream<List<int>>;
      String buffer = '';

      await for( final chunk in stream ) {
        final chunkString = utf8.decode( chunk, allowMalformed:true );
        buffer += chunkString;
        yield buffer;
      }
    }

    Stream<String> getChstResponseStream( String prompt, String chatId, { List<XFile> files = const [] } ) async* {

      final formData = FormData();

      formData.fields.add( MapEntry('prompt', prompt) );
      formData.fields.add( MapEntry('chatId', chatId) );

      if (files.isNotEmpty) {
        for (final file in files) {
          formData.files.add( MapEntry( 'files', await MultipartFile.fromFile(file.path, filename: file.name), ), );
        }
      }
      
      final response = await _http.post(
        '/chat-stream',
        data    : formData,
        options : Options( responseType: ResponseType.stream)
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