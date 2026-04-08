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
      yield* _getStreamResponse(
        prompt    : prompt, 
        endpoint  : '/basic-prompt-stream',
        files     : files,
      );
    }

    Stream<String> getChstResponseStream( String prompt, String chatId, { List<XFile> files = const [] } ) async* {
      yield* _getStreamResponse(
        prompt    : prompt, 
        endpoint  : '/chat-stream',
        files     : files,
        formFields: { 'chatId' : chatId },
      );
    }

    // Emitir sl tream de informacion
    Stream<String> _getStreamResponse({ 
      required String prompt, 
      required String endpoint,
      List<XFile> files = const [],
      Map<String, dynamic> formFields = const {},
    }) async* {

      final formData = FormData();
      formData.fields.add( MapEntry( 'prompt', prompt ) );
      for( final entry in formFields.entries ) {
        formData.fields.add( MapEntry( entry.key, entry.value ) );
      }

      if (files.isNotEmpty) {
        for (final file in files) {
          formData.files.add( MapEntry( 'files', await MultipartFile.fromFile(file.path, filename: file.name), ), );
        }
      }
      
      final response = await _http.post(
        endpoint,
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

    Future<String?> generateImage( String prompt, { List<XFile> files = const [] } ) async {

      final formData = FormData();
      formData.fields.add( MapEntry('prompt', prompt ) );

      for ( final file in files ) {
          formData.files.add( MapEntry('files', await MultipartFile.fromFile( file.path, filename: file.name ) ) );
      }

      try {
        final response = await _http.post('/image-generation', data : formData );
        final imageURl = response.data['imageUrl'];
        return imageURl;
      } catch (e) {
        print(e);
        return null;
      }
    }

}