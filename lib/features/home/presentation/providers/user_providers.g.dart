// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(geminiUser)
final geminiUserProvider = GeminiUserProvider._();

final class GeminiUserProvider extends $FunctionalProvider<User, User, User>
    with $Provider<User> {
  GeminiUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'geminiUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$geminiUserHash();

  @$internal
  @override
  $ProviderElement<User> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  User create(Ref ref) {
    return geminiUser(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(User value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<User>(value),
    );
  }
}

String _$geminiUserHash() => r'5773870bf6bde5690a8be47b75e2109eb7e5d8d0';

@ProviderFor(normalUser)
final normalUserProvider = NormalUserProvider._();

final class NormalUserProvider extends $FunctionalProvider<User, User, User>
    with $Provider<User> {
  NormalUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'normalUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$normalUserHash();

  @$internal
  @override
  $ProviderElement<User> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  User create(Ref ref) {
    return normalUser(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(User value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<User>(value),
    );
  }
}

String _$normalUserHash() => r'eab35b719488620c294f3a034cbd82e2b57f3ef7';
