import 'package:flutter/material.dart';
import 'package:flutter_accounts_crud/notifier/accounts_notifier.dart';
import 'package:flutter_accounts_crud/ui/pages/account_add_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

AccountsNotifier accounts = AccountsNotifier();

Widget createHomeScreen(String id) => ChangeNotifierProvider<AccountsNotifier>(
      create: (context) => AccountsNotifier(),
      child: MaterialApp(
        home: AccountAddPage(id: id),
      ),
    );

Future<void> main() async {
  setUp(() async {});
  group('Widget Tests', () {
    testWidgets('Button and textfield test', (tester) async {
      await tester.pumpWidget(createHomeScreen("0"));

      final firstNameField = find.byKey(Key('firstName'));
      expect(firstNameField, findsOneWidget);

      final lastNameField = find.byKey(Key('lastName'));
      expect(lastNameField, findsOneWidget);

      final birthDateField = find.byKey(Key('birthDate'));
      expect(birthDateField, findsOneWidget);

      final salaryField = find.byKey(Key('salary'));
      expect(salaryField, findsOneWidget);

      final identityField = find.byKey(Key('identityNumber'));
      expect(identityField, findsOneWidget);

      final phoneField = find.byKey(Key('phoneNumber'));
      expect(phoneField, findsOneWidget);

      final saveButton = find.byKey(Key('save'));
      expect(saveButton, findsOneWidget);
    });
  });
}
