import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_accounts_crud/notifier/accounts_notifier.dart';
import 'package:flutter_accounts_crud/ui/widgets/datetime_field.dart';
import 'package:flutter_accounts_crud/ui/widgets/input_formatter.dart/masked_input_formatter.dart';
import 'package:provider/provider.dart';

class AccountAddPage extends StatefulWidget {
  String id;
  AccountAddPage({Key? key, required this.id}) : super(key: key);

  @override
  _AccountAddPageState createState() => _AccountAddPageState();
}

class _AccountAddPageState extends State<AccountAddPage> {
  bool _offSecureText = true;
  bool _accountsAddStarted = false;
  bool _accountsAddCompleted = false;

  var _formKey = GlobalKey<FormState>();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 0),
            child: ListView(
              children: <Widget>[
                SizedBox(height: 20),
                _buildBackButton(context),
                Text(widget.id.isEmpty ? 'accountAdd'.tr() : 'accountUpdate'.tr(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
                SizedBox(height: 20),
                _buildFirstNameFormField(),
                SizedBox(height: 20),
                _buildLastNameFormField(),
                SizedBox(height: 20),
                _buildBirthDateFormField(),
                SizedBox(height: 20),
                _buildSalaryFormField(),
                SizedBox(height: 20),
                _buildPhoneFormField(),
                SizedBox(height: 20),
                _buildIdentityFormField(),
                SizedBox(height: 50),
                _buildAccountAddButton(),
                SizedBox(height: 50),
              ],
            ),
          ),
        ));
  }

  Container _buildBackButton(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      child: IconButton(
          key: Key("back"),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(0),
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  Widget _buildFirstNameFormField() {
    return Consumer<AccountsNotifier>(builder: (context, model, child) {
      return TextFormField(
        key: Key("firstName"),
        controller: model.nameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'firstName'.tr(),
          hintText: 'firstName'.tr(),
        ),
        validator: (value) {
          if (value!.isEmpty) return "firstNameCannotBeEmpty".tr();
          return null;
        },
      );
    });
  }

  Widget _buildLastNameFormField() {
    return Consumer<AccountsNotifier>(builder: (context, model, child) {
      return TextFormField(
        key: Key("lastName"),
        controller: model.surnameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'lastName'.tr(),
          hintText: 'lastName'.tr(),
        ),
        validator: (value) {
          if (value!.isEmpty) return "lastNameCannotBeEmpty".tr();
          return null;
        },
      );
    });
  }

  Widget _buildBirthDateFormField() {
    return Consumer<AccountsNotifier>(builder: (context, model, child) {
      return DateTextField(
        key: Key("birthDate"),
        textEditingController: model.birthdateController,
        textTitle: "birthDate".tr(),
        isRequired: false,
        onChanged: (val) => {val},
      );
    });
  }

  Widget _buildSalaryFormField() {
    return Consumer<AccountsNotifier>(builder: (context, model, child) {
      return TextFormField(
        key: Key("salary"),
        decoration: InputDecoration(
          hintText: 'salary'.tr(),
          labelText: 'salary'.tr(),
        ),
        controller: model.salaryController,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) return "salaryCannotBeEmpty".tr();
          return null;
        },
      );
    });
  }

  Widget _buildPhoneFormField() {
    return Consumer<AccountsNotifier>(builder: (context, model, child) {
      return TextFormField(
        key: Key("phoneNumber"),
        decoration: InputDecoration(
          hintText: 'phoneNumber'.tr(),
          labelText: 'phoneNumber'.tr(),
        ),
        controller: model.phoneController,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          MaskedTextInputFormatter(mask: 'xxxx xxx xx xx', separator: ' '),
        ],
        validator: (value) {
          if (value!.isEmpty) return "phoneNumberCannotBeEmpty".tr();
          return null;
        },
      );
    });
  }

  Widget _buildIdentityFormField() {
    return Consumer<AccountsNotifier>(builder: (context, model, child) {
      return TextFormField(
        key: Key("identityNumber"),
        decoration: InputDecoration(
          hintText: 'identityNumber'.tr(),
          labelText: 'identityNumber'.tr(),
        ),
        controller: model.identityController,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          MaskedTextInputFormatter(mask: 'xxxxxxxxxxx', separator: ' '),
        ],
        validator: (value) {
          if (value!.isEmpty) return "identityCannotBeEmpty".tr();
          return null;
        },
      );
    });
  }

  Widget _buildAccountAddButton() {
    return Consumer<AccountsNotifier>(builder: (context, model, child) {
      return Container(
        height: 45,
        width: double.infinity,
        child: ElevatedButton(
            key: Key("save"),
            style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
            child: _accountsAddStarted == false
                ? Text(
                    widget.id.isEmpty ? 'accountAdd'.tr() : 'accountUpdate'.tr(),
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
                : _accountsAddCompleted == false
                    ? CircularProgressIndicator(backgroundColor: Colors.white)
                    : Text(widget.id.isEmpty ? 'accountAddSuccessful'.tr() : 'accountUpdateSuccessful'.tr(),
                        style: TextStyle(fontSize: 16, color: Colors.white)),
            onPressed: () {
              widget.id.isEmpty ? model.addAccount(context) : model.updateAccount(widget.id, context);
            }),
      );
    });
  }
}
