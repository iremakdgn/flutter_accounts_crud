import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_accounts_crud/notifier/accounts_notifier.dart';
import 'package:flutter_accounts_crud/ui/pages/account_add_page.dart';
import 'package:flutter_accounts_crud/ui/widgets/next_screen.dart';
import 'package:flutter_accounts_crud/ui/widgets/skeleton.dart';
import 'package:flutter_accounts_crud/shared/globals.dart' as globals;
import 'package:provider/provider.dart';
import 'package:skeleton_text/skeleton_text.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = false;

  ScrollController _scrollController = ScrollController();

  Future loadData() async {
    await Future.delayed(const Duration(milliseconds: 10)).then((_) => globals.lang = context.locale.toLanguageTag());
    Provider.of<AccountsNotifier>(context, listen: false).loadAccountList();
    setState(() => _loading = true);
  }

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);
    Provider.of<AccountsNotifier>(context, listen: false).loadAccountList();
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (!Provider.of<AccountsNotifier>(context, listen: false).loading &&
        !Provider.of<AccountsNotifier>(context, listen: false).lastData &&
        _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      Provider.of<AccountsNotifier>(context, listen: false).page++;
      Provider.of<AccountsNotifier>(context, listen: false).loadAccountList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountsNotifier>(
      builder: (context, model, child) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
              key: const Key('add_new_account'),
              onPressed: () {
                nextScreen(context, AccountAddPage(id: ""));
              },
              child: const Icon(Icons.add),
            ),
            appBar: AppBar(
              title: Text('accounts'.tr()),
            ),
            body: model.loading
                ? const Skeleton()
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: model.accountList.length,
                    cacheExtent: 20.0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildListCard(model, index),
                    ),
                  ));
      },
    );
  }

  Card buildListCard(AccountsNotifier model, int index) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${"firstName".tr()}: ${model.accountList[index].name!}",
                  key: const Key('text_name'),
                ),
                const SizedBox(height: 4),
                Text(
                  "${"lastName".tr()}: ${model.accountList[index].surname!}",
                  key: const Key('text_surname'),
                ),
                const SizedBox(height: 4),
                Text(
                  "${"birthDate".tr()}: ${model.accountList[index].birthDate!}",
                  key: const Key('text_birthdate'),
                ),
                const SizedBox(height: 4),
                Text(
                  "${"salary".tr()}: ${model.accountList[index].salary!}",
                  key: const Key('text_salary'),
                ),
                const SizedBox(height: 4),
                Text(
                  "${"phoneNumber".tr()}: ${model.accountList[index].phoneNumber!}",
                  key: const Key('text_phone'),
                ),
                const SizedBox(height: 4),
                Text(
                  "${"identityNumber".tr()}: ${model.accountList[index].identity!}",
                  key: const Key('text_identity'),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                key: Key('icon_edit_' + index.toString()),
                icon: Icon(Icons.edit),
                onPressed: () async {
                  await model.getById(model.accountList[index].id!);
                  nextScreen(context, AccountAddPage(id: model.accountList[index].id!));
                },
              ),
              IconButton(
                key: Key('icon_delete_' + index.toString()),
                icon: Icon(Icons.delete),
                onPressed: () {
                  buildDeleteShowDialog(model, index);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> buildDeleteShowDialog(AccountsNotifier model, int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('deleteAccount'.tr()),
          content: Text('wantDeleteAccount'.tr()),
          actions: <Widget>[
            TextButton(
              child: const Text("Ok"),
              onPressed: () {
                Provider.of<AccountsNotifier>(context, listen: false).deleteAccount(model.accountList[index].id!);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("cancel".tr()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
