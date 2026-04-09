// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_art_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedArt)
final selectedArtProvider = SelectedArtProvider._();

final class SelectedArtProvider extends $NotifierProvider<SelectedArt, String> {
  SelectedArtProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedArtProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedArtHash();

  @$internal
  @override
  SelectedArt create() => SelectedArt();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$selectedArtHash() => r'532814f032350e171169f52459cbaa514a8905cc';

abstract class _$SelectedArt extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
