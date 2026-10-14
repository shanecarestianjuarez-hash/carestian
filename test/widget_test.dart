import 'package:flutter_test/flutter_test.dart';
import 'package:war_project/main.dart';

void main() {
  testWidgets('login validates credentials and opens the dashboard',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(900, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const AttendanceApp());

    expect(find.text('Welcome back'), findsOneWidget);

    await tester.ensureVisible(find.byKey(const Key('login_submit')));
    await tester.tap(find.byKey(const Key('login_submit')));
    await tester.pumpAndSettle();

    expect(find.text('Enter your email address'), findsOneWidget);
    expect(find.text('Enter your password'), findsOneWidget);

    await tester.ensureVisible(find.byKey(const Key('login_email')));
    await tester.enterText(
      find.byKey(const Key('login_email')),
      'teacher@school.edu',
    );
    await tester.ensureVisible(find.byKey(const Key('login_password')));
    await tester.enterText(
      find.byKey(const Key('login_password')),
      'classroom-password',
    );
    await tester.ensureVisible(find.byKey(const Key('login_submit')));
    await tester.tap(find.byKey(const Key('login_submit')));
    await tester.pumpAndSettle();

    expect(find.text('Welcome, Teacher!'), findsOneWidget);
  });
}
