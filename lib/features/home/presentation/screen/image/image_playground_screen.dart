import 'package:flutter/material.dart';
import 'package:gemini_app/features/home/presentation/widgets/image/history_grid.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gemini_app/config/config.dart';
import 'package:gemini_app/features/home/presentation/widgets/chat/chat.dart';
import 'package:gemini_app/features/home/presentation/providers/images/images.dart';

const imageArtStyles = [
  'Realista',
  'Acuarela',
  'Dibujo a Lápiz',
  'Arte Digital',
  'Pintura al Óleo',
  'Acuarela',
  'Dibujo al Carboncillo',
  'Ilustración Digital',
  'Estilo Manga',
];

class ImagePlaygroundScreen extends StatelessWidget {

  static String path = '/image-playground';

  const ImagePlaygroundScreen({super.key});

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(title: Text('Imágenes con Gemini')),
      backgroundColor: colorSeed,
      body: Column(
        children: [

          // Espacio para imágenes generadas
          GeneratedImageGallery(),

          // Selector de estilo de arte
          ArtStyleSelector(),

          // Llenar el espacio
          Expanded( child : Padding(
            padding : const EdgeInsets.all(8),
            child   : HistoryGrid(),
          ) ),

          // Espacio para el prompt
          Consumer( builder: (context, ref, child) => CustomBottomInput( onSend: ( partialText, {List<XFile> images = const []}) async {

                final generatedImagesNotifier = ref.read( generatedImagesProvider.notifier);
                final selectedStyle = ref.read( selectedArtProvider );
                String promptWithStyle = partialText.text;

                if( selectedStyle.isNotEmpty ) promptWithStyle = '${partialText.text} con el estilo de $selectedStyle';

                generatedImagesNotifier.generatedImage( promptWithStyle, images : images );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GeneratedImageGallery extends ConsumerWidget {

  const GeneratedImageGallery({super.key});

  @override
  Widget build( BuildContext context, ref ) {

    final isGenerating    = ref.watch( isGeneratingProvider );
    final generatedImages = ref.watch( generatedImagesProvider );

    return SizedBox(
      height: 250,
      child: PageView(
        onPageChanged: (index) {
          if (index == generatedImages.length - 1 ) {
            ref.read( generatedImagesProvider.notifier ).generatedImageWithPreviousPrompt();
          }
        },
        controller: PageController(
          viewportFraction: 0.6, // Muestra 1.5 imágenes en la pantalla
          initialPage: 0,
        ),
        padEnds: true, // Cambiado a true para centrar la primera imagen
        children: [
          //* Placeholder hasta que se genere al menos una imagen
          if( generatedImages.isEmpty && !isGenerating )
          const EmptyPlaceholderImage(),

          //* Aquí iremos colocando las imágenes generadas
          ...generatedImages.map( ( imgUrl ) => GeneratedImage(
              imageUrl : imgUrl,
            ),
          ),

          if( isGenerating )
          const GeneratingPlaceholderImage(),
        ],
      ),
    );
  }
}

class GeneratedImage extends StatelessWidget {
  final String imageUrl;

  const GeneratedImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 5,
            spreadRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}

class ArtStyleSelector extends StatelessWidget {

  const ArtStyleSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child : Consumer( builder: (context, ref, child) {
        return  ListView.builder(
          scrollDirection : Axis.horizontal,
          itemCount       : imageArtStyles.length,
          itemBuilder     : (context, index) {
              final selectedArt = ref.watch( selectedArtProvider );
              final style = imageArtStyles[index];
              final activeColor = selectedArt == style ? Theme.of(context).colorScheme.primaryContainer : null;
          
              return GestureDetector(
                onTap: () {
                  ref.read( selectedArtProvider.notifier ).setSelectedArt( style );
                },
                child: Padding(
                  padding : const EdgeInsets.symmetric(horizontal: 4.0),
                  child   : Chip(
                    label           : Text(style),
                    backgroundColor : activeColor,
                    ),
                  ),
              );
            },
          );
        },
      ),
    );
  }
}

class EmptyPlaceholderImage extends StatelessWidget {
  const EmptyPlaceholderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 5,
            spreadRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.image_outlined, size: 50, color: Colors.white),
          const Text('Empieza a generar imágenes'),
        ],
      ),
    );
  }
}

class GeneratingPlaceholderImage extends StatelessWidget {
  const GeneratingPlaceholderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 5,
            spreadRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
          const SizedBox(height: 15),
          const Text(
            'Generando imagen...',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}