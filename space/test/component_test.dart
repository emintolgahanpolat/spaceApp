import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:space/main_test.dart';

void main() {
  group('Component Test - Anasayfa ', () {
    testWidgets('Scroll  test ', (tester) async {
      await tester.pumpWidget(const TestApp());

      expect(find.text('1'), findsOneWidget);
      await tester.fling(find.byType(GridView), const Offset(0, -300), 5000);
      await tester.pumpAndSettle();
      expect(find.text('1'), findsNothing);
    });

    testWidgets('GridView does not cache itemBuilder calls',
        (WidgetTester tester) async {
      final Map<int, int> counters = <int, int>{};

      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: GridView.builder(
          itemCount: 1000,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            counters[index] = (counters[index] ?? 0) + 1;
            return SizedBox(
              key: ValueKey<int>(index),
              width: 200,
              height: 200,
            );
          },
        ),
      ));

      expect(find.byKey(const ValueKey<int>(4)), findsOneWidget);
      expect(counters[4], 1);

      await tester.fling(find.byType(GridView), const Offset(0, -300), 5000);
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey<int>(4)), findsNothing);
      expect(counters[4], 1);

      await tester.fling(find.byType(GridView), const Offset(0, 300), 5000);
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey<int>(4)), findsOneWidget);
      expect(counters[4], 2);
    });
  });
}
