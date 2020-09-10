import 'dart:async';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

void useStateController<T>(
  StateProvider<StateController<T>> provider,
  Listener<T> listener,
) {
  final value = useProvider(provider).state;

  useEffect(() {
    final removeListener = value.addListener(listener);
    return removeListener;
  }, [provider]);
}

void useAsyncEffect(
  FutureOr<dynamic> Function() effect,
  FutureOr<dynamic> Function() cleanup, [
  List<Object> keys,
]) {
  useEffect(() {
    Future.microtask(effect);
    return () {
      if (cleanup != null) {
        Future.microtask(cleanup);
      }
    };
  }, keys);
}
