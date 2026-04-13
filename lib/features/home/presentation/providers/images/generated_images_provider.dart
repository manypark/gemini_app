import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gemini_app/config/gemini/gemini_impl.dart';
import 'package:gemini_app/features/home/presentation/providers/images/images.dart';

part 'generated_images_provider.g.dart';

@Riverpod( keepAlive : true)
class GeneratedImages extends _$GeneratedImages {

  final GeminiImpl gemini = GeminiImpl();

  String previousPrompt = '';
  List<XFile> previousImages = [];

  @override
  List<String> build() => [];

  void addImage( String imageUrl ) {
    if(ref.mounted) return;
    if( imageUrl == '' ) return;
    ref.read( generatingHistoryProvider.notifier ).addImage(imageUrl);
    state = [ ...state, imageUrl ];
  }

  void clearImages() {
    state = [];
  }

  Future<void> generatedImage( String prompt, { List<XFile> images = const [] } ) async {
    ref.read( isGeneratingProvider.notifier ).setIsGenerating();

    final imageUrl = await gemini.generateImage(prompt, files : images );

    if( imageUrl == null ) {
      ref.read( isGeneratingProvider.notifier ).setIsNotGenerating();
      return;
    }

    previousPrompt = prompt;
    previousImages = images;

    addImage(imageUrl);
    ref.read( isGeneratingProvider.notifier ).setIsNotGenerating();

    if ( state.length == 1 ) {
      generatedImageWithPreviousPrompt();
    }
  }

  Future<void> generatedImageWithPreviousPrompt() async {
    if ( previousPrompt.isEmpty ) return;

    await generatedImage( previousPrompt, images : previousImages );
  }

}