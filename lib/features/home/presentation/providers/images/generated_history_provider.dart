import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated_history_provider.g.dart';

@Riverpod( keepAlive : true)
class GeneratingHistory extends _$GeneratingHistory {
  @override
  List<String> build() => [];

  void addImage( String imageUrl ) {
    if( imageUrl == '' ) return;
    state = [ imageUrl, ...state ];
  }

}