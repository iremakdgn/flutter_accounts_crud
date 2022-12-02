import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Application Performance Tests', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      await driver.close();
    });

    test('Scrolling test started', () async {
      final listFinder = find.byType('ListView');
      final scrollingTimeline = await driver.traceAction(() async {
        await Future.delayed(Duration(seconds: 1));
        await driver.scroll(listFinder, 0, -2000, Duration(seconds: 3));
        await Future.delayed(Duration(seconds: 1));
        await driver.scroll(listFinder, 0, 2000, Duration(seconds: 3));
      });

      final scrollingSummary = TimelineSummary.summarize(scrollingTimeline);
      await scrollingSummary.writeSummaryToFile('scrolling', pretty: true);
      await scrollingSummary.writeTimelineToFile('scrolling', pretty: true);
    });

    test("Delete test started", () async {
      final operationsTimeline = await driver.traceAction(() async {
        await driver.tap(find.byValueKey("icon_delete_1"));

        await driver.waitFor(find.text('Ok'));
        await Future.delayed(Duration(seconds: 1));
        await driver.tap(find.text('Ok'));
      });
    });

    test("Edit account test started", () async {
      final operationsTimeline = await driver.traceAction(() async {
        await driver.tap(find.byValueKey("icon_edit_2"));
        await Future.delayed(Duration(seconds: 2));

        final firstNameField = find.byValueKey('firstName');
        driver.tap(firstNameField);
        driver.enterText("İrem");

        final lastNameField = find.byValueKey('lastName');
        driver.tap(lastNameField);
        driver.enterText("Akdoğan");

        final identityField = find.byValueKey('identityNumber');
        driver.tap(identityField);
        driver.enterText("13599543278");

        final saveButton = find.byValueKey('save');
        await driver.tap(saveButton);
        await Future.delayed(Duration(seconds: 2));
      });
    });

    test("Add account test started", () async {
      final operationsTimeline = await driver.traceAction(() async {
        await driver.tap(find.byValueKey("add_new_account"));
        await Future.delayed(Duration(seconds: 2));

        final firstNameField = find.byValueKey('firstName');
        driver.tap(firstNameField);
        driver.enterText("İrem");

        final lastNameField = find.byValueKey('lastName');
        driver.tap(lastNameField);
        driver.enterText("Akdoğan");

        final salaryField = find.byValueKey('salary');
        driver.tap(salaryField);
        driver.enterText("2000");

        final phoneField = find.byValueKey('phoneNumber');
        driver.tap(phoneField);
        driver.enterText("5545741305");

        final identityField = find.byValueKey('identityNumber');
        driver.tap(identityField);
        driver.enterText("13599543278");

        final backButton = find.byValueKey('back');
        // final saveButton = find.byValueKey('save');
        await driver.tap(backButton);

        await Future.delayed(Duration(seconds: 2));
      });
    });
  });
}
