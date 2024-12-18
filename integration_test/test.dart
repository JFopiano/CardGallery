import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:card_gallery/flutter_flow/flutter_flow_drop_down.dart';
import 'package:card_gallery/flutter_flow/flutter_flow_icon_button.dart';
import 'package:card_gallery/flutter_flow/flutter_flow_widgets.dart';
import 'package:card_gallery/flutter_flow/flutter_flow_theme.dart';
import 'package:card_gallery/index.dart';
import 'package:card_gallery/main.dart';
import 'package:card_gallery/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:card_gallery/backend/firebase/firebase_config.dart';
import 'package:card_gallery/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('User Story 2', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: StartUpPageWidget(),
      ),
    ));

    await tester.tap(find.byKey(ValueKey('LogIn_61wv')));
    await tester.pumpAndSettle(Duration(milliseconds: 2000));
    await tester.enterText(
        find.byKey(ValueKey('Login-Email_xapx')), 'natasha.egd@gmail.com');
    await tester.enterText(
        find.byKey(ValueKey('Login-Password_i9du')), '12312312');
    await tester.tap(find.byKey(ValueKey('Button_n68z')));
    await tester.pumpAndSettle(Duration(milliseconds: 60000));
    expect(find.text('Log In'), findsOneWidget);
    await tester.tap(find.byKey(ValueKey('UNDEFINED')));
    await tester.pumpAndSettle(Duration(milliseconds: 1000));
    expect(find.text('Register'), findsOneWidget);
    await tester.tap(find.byKey(ValueKey('LogIn_61wv')));
    await tester.pumpAndSettle(Duration(milliseconds: 2000));
    await tester.enterText(
        find.byKey(ValueKey('Login-Email_xapx')), 'natasha.egd@gmail.com');
    await tester.enterText(
        find.byKey(ValueKey('Login-Password_i9du')), '123123123');
    await tester.tap(find.byKey(ValueKey('Button_n68z')));
    await tester.pumpAndSettle(Duration(milliseconds: 5000));
    expect(find.text('Edit Profile'), findsOneWidget);
  }, skip: true);

  testWidgets('User Story 2 ls', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: StartUpPageWidget(),
      ),
    ));

    await tester.pumpAndSettle(Duration(milliseconds: 10000));
    await tester.tap(find.byKey(ValueKey('LogIn_61wv')));
    await tester.pumpAndSettle(Duration(milliseconds: 2000));
    await tester.enterText(
        find.byKey(ValueKey('Login-Email_xapx')), 'natasha.egd@gmail.com');
    await tester.enterText(
        find.byKey(ValueKey('Login-Password_i9du')), '123123123');
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 20000),
    );
    await tester.tap(find.byKey(ValueKey('Button_n68z')));
    await tester.tap(find.byKey(ValueKey('Button_n68z')));
    expect(find.byKey(ValueKey('SettingsBtn_ohof')), findsNothing);
  });

  testWidgets('User Story 1', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: StartUpPageWidget(),
      ),
    ));

    await tester.tap(find.text('REGISTER'));
    await tester.pumpAndSettle(Duration(milliseconds: 1000));
    await tester.enterText(find.text('Email...'), 'jasonfop+1@gmail.com');
    await tester.enterText(find.text('Username...'), '_Oreos');
    await tester.enterText(find.text('Password...'), '1234567');
    await tester.enterText(find.text('Confirm Password...'), '1234567');
    await tester.tap(find.text('NEXT'));
    await tester.tap(find.text('Magic: The Gathering'));
    await tester.tap(find.text('CONTINUE'));
    expect(find.byKey(ValueKey('SettingsBtn_ohof')), findsNothing);
  });

  testWidgets('user story 4', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'daniel.huskey@icloud.com', password: '1234567');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: ProfileBioWidget(),
      ),
    ));

    await tester.tap(find.byKey(ValueKey('AddCardBtn_83x4')));
    await tester.tap(find.text('Select TCG...'));
    await tester.tap(find.text('Pokemon'));
    await tester.enterText(find.text('Card Name'), 'charizard');
    await tester.pumpAndSettle(
      Duration(milliseconds: 100000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 1000000),
    );
    expect(find.text('Add to collection'), findsNothing);
  });

  testWidgets('User Story 6', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'natasha.egd+2@gmail.com', password: '1234567');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(),
    ));

    await tester.pumpAndSettle(Duration(milliseconds: 2000));
    await tester.tap(find.byKey(ValueKey('card_k3w9')));
    await tester.pumpAndSettle(Duration(milliseconds: 2000));
    expect(find.text('Pikachu ex'), findsOneWidget);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
