import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testtypes/widget/myWidget.dart';
import 'package:testtypes/widget/todoList.dart';

void main() {
  testWidgets('MyWidget tem um titulo e uma mensagem',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyWidget(title: 'T', message: 'M'));

    final titleFinder = find.text('T');
    final messageFinde = find.text('M');

    expect(titleFinder, findsOneWidget);
    expect(messageFinde, findsOneWidget);
  });

  testWidgets('find a Text Widget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: Text('H'),
    )));

    expect(find.text('H'), findsOneWidget);
  });

  testWidgets('finds a widget using a Key', (WidgetTester tester) async {
    final testKey = Key('K');

    await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));

    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('finds a specific instance', (WidgetTester tester) async {
    final childWidget = Padding(padding: EdgeInsets.zero);

    await tester.pumpWidget(Container(child: childWidget));

    expect(find.byWidget(childWidget), findsOneWidget);
  });

  testWidgets('Add and remove todo', (WidgetTester tester) async {
    await tester.pumpWidget(TodoList());

    await tester.enterText(find.byType(TextField), 'hi');
  });
}
