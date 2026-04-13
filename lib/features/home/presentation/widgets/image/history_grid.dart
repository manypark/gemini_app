import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_app/features/home/presentation/providers/images/images.dart';

class HistoryGrid extends ConsumerWidget {

  const HistoryGrid({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final generatedHistory = ref.watch( generatingHistoryProvider );

    return GridView.builder(
      itemCount   : generatedHistory.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount  : 4,
        childAspectRatio: 1,
        mainAxisSpacing : 10,
        crossAxisSpacing: 10
      ),
      itemBuilder : (context, index) {

        final imageUrl = generatedHistory[index];

        return GestureDetector(
          onTap: () {
            
          },
          child: Container(
            width     : 100,
            height    : 100,
            decoration: BoxDecoration(
              border      : Border.all( width : 1, color : Colors.blue),
              borderRadius: BorderRadius.circular( 10 ),
              image       : DecorationImage(
                image : NetworkImage(imageUrl),
                fit   : BoxFit.cover,
              )
            ),
          ),
        );
      },
    );
  }
}