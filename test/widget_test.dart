import 'package:flutter_test/flutter_test.dart';

import 'package:mind_space/main.dart';

void main() {
  testWidgets('MindSpace app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MindSpaceApp());

    // Verify app builds without crashing
    expect(find.byType(MindSpaceApp), findsOneWidget);
  });
}
