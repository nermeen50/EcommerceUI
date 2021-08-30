//
// Generated file. Do not edit.
//

// @dart = 2.7

import 'package:test_ecommerce/main.dart' as entrypoint;
import 'dart:io'; // ignore: dart_io_import.
import 'package:shared_preferences_linux/shared_preferences_linux.dart';
import 'package:shared_preferences_windows/shared_preferences_windows.dart';

@pragma('vm:entry-point')
void _registerPlugins() {
  if (Platform.isLinux) {
      SharedPreferencesLinux.registerWith();
  } else if (Platform.isMacOS) {
  } else if (Platform.isWindows) {
      SharedPreferencesWindows.registerWith();
  }
}
void main() {
  entrypoint.main();
}
