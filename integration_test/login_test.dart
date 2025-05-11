import 'package:flutter/cupertino.dart';
import 'package:flutter_skeleton/main.dart' as app;

import 'package:flutter_test/flutter_test.dart';

void loginTest() {
  testWidgets("Login Page Testing", (tester) async {
    app.main();
    await tester.pumpAndSettle();
    final loginTitle = find.byKey(
      const Key("login_title"),
    );
    await tester.pumpAndSettle();
    // Finds the login  button to tap on.
    final loginButton = find.byKey(const Key("login_button"));
    await tester.pumpAndSettle();
    await tester.ensureVisible(loginButton);
    await tester.pumpAndSettle();
    expect(
      loginTitle,
      findsOneWidget,
    );
    await tester.pumpAndSettle();
    // Emulate a tap on the login button.
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
  });
}
