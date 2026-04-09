// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_images_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GeneratedImages)
final generatedImagesProvider = GeneratedImagesProvider._();

final class GeneratedImagesProvider
    extends $NotifierProvider<GeneratedImages, List<String>> {
  GeneratedImagesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'generatedImagesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$generatedImagesHash();

  @$internal
  @override
  GeneratedImages create() => GeneratedImages();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$generatedImagesHash() => r'cc12721459c1cbbbda0c6567f7a6fee01bfd5403';

abstract class _$GeneratedImages extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
