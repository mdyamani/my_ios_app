import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:my_ios_app/main.dart' as app;

/// Store screenshots. Each takeScreenshot() becomes one PNG, named in order.
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('store screenshots', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    if (Platform.isAndroid) {
      await binding.convertFlutterSurfaceToImage();
      await tester.pumpAndSettle();
    }

    await binding.takeScreenshot('01_home');

    for (var i = 0; i < 7; i++) {
      await tester.tap(find.byIcon(Icons.add));
    }
    await tester.pumpAndSettle();
    await binding.takeScreenshot('02_counting');

    await tester.tap(find.byIcon(Icons.palette));
    await tester.tap(find.byIcon(Icons.palette));
    await tester.pumpAndSettle();
    await binding.takeScreenshot('03_colors');
  });
}
