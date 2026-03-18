// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_gemini_writing.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IsGeminiWriting)
final isGeminiWritingProvider = IsGeminiWritingProvider._();

final class IsGeminiWritingProvider
    extends $NotifierProvider<IsGeminiWriting, bool> {
  IsGeminiWritingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isGeminiWritingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isGeminiWritingHash();

  @$internal
  @override
  IsGeminiWriting create() => IsGeminiWriting();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isGeminiWritingHash() => r'a1231f9693f82ccc071d1ffb60bcc853d7c4696e';

abstract class _$IsGeminiWriting extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
