import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

/// Runs on the build machine and saves each `takeScreenshot` call as a PNG.
Future<void> main() async {
  final dir = Platform.environment['SCREENSHOT_DIR'] ?? 'screenshots';
  await integrationDriver(
    onScreenshot: (name, bytes, [args]) async {
      final file = await File('$dir/$name.png').create(recursive: true);
      await file.writeAsBytes(bytes);
      return true;
    },
  );
}
