import 'package:hooks_riverpod/hooks_riverpod.dart';

final configProvider = Provider((_) => Configuration());

class Configuration {
  final storageBox = 'flutter_storage';
  final flavors = ['ios', 'android', 'release', 'profile', 'web'];
  final routes = ['dashboard', 'tool', 'myAccount', 'login', 'share', 'manage'];
}
