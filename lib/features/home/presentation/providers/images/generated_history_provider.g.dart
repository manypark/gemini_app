// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GeneratingHistory)
final generatingHistoryProvider = GeneratingHistoryProvider._();

final class GeneratingHistoryProvider
    extends $NotifierProvider<GeneratingHistory, List<String>> {
  GeneratingHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'generatingHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$generatingHistoryHash();

  @$internal
  @override
  GeneratingHistory create() => GeneratingHistory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$generatingHistoryHash() => r'7502440808bde1cbec476eadcd548f6dc8bf816b';

abstract class _$GeneratingHistory extends $Notifier<List<String>> {
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
