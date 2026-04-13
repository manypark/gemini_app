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
        isAutoDispose: false,
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

String _$generatingHistoryHash() => r'692209dbde381a8de9c358ebcb0dedbbca004e92';

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
