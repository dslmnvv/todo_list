import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_list/main.dart' as app;

void main(){

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('test add task',
            (tester) async {
          await app.main();
          await tester.pumpAndSettle();


          final Finder addButton = find.byIcon(Icons.add);
          await tester.tap(addButton);

          await Future.delayed(const Duration(seconds: 2));

          String testMessageTask = 'Integration test task';

          await tester.enterText(
          find.byType(TextFormField).first,
          testMessageTask);

          //Еще не разобрался как можно вытащить локаль
          final Finder saveButton = find.text('Сохранить');
          tester.tap(saveButton);

          await Future.delayed(const Duration(seconds: 3));
          
          expect(find.text(testMessageTask), findsWidgets);

        });
  });

}