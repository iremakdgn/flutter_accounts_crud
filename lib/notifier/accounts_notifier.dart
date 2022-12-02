import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_accounts_crud/model/accounts_dto.dart';
import 'package:flutter_accounts_crud/api/accounts_api.dart';
import 'package:flutter_accounts_crud/model/accounts_dto.dart';
import 'package:flutter_accounts_crud/shared/message_helper.dart';
import 'package:tckn_check/tckn_check.dart';

class AccountsNotifier extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  int page = 1;

  bool _lastData = false;
  bool get lastData => _lastData;

  final List<AccountsDto> _accountList = [];
  List<AccountsDto> get accountList => _accountList;

  var phoneController = TextEditingController();
  var salaryController = TextEditingController();
  var identityController = TextEditingController();
  var birthdateController = TextEditingController();
  var nameController = TextEditingController();
  var surnameController = TextEditingController();

  Future getById(String id) async {
    _loading = true;
    var model = await AccountsApi().getById(id);
    phoneController.text = model.phoneNumber ?? "";
    salaryController.text = model.salary.toString();
    nameController.text = model.name ?? "";
    birthdateController.text = model.birthDate ?? "";
    nameController.text = model.name ?? "";
    surnameController.text = model.surname ?? "";
    identityController.text = model.identity ?? "";
    _loading = false;
    notifyListeners();
  }

  Future loadAccountList() async {
    _loading = true;
    var accounts = await AccountsApi().getListByPaging(page, 4);
    if (accounts == null || accounts.isEmpty)
      _lastData = true;
    else
      _accountList.addAll(accounts);
    _loading = false;
    notifyListeners();
  }

  Future deleteAccount(String id) async {
    var response = await AccountsApi().deleteAccountById(id);
    if (response) {
      showToast('deleted'.tr());
    } else {
      showToast('error'.tr());
    }
    var account = _accountList.firstWhere((element) => element.id == id);
    _accountList.remove(account);
    notifyListeners();
  }

  Future updateAccount(String id, BuildContext context) async {
    var identity = Tckn().check(identityController.text);

    if (nameController.text.isEmpty) {
      showToast("firstNameCannotBeEmpty".tr());
      return;
    }
    if (surnameController.text.isEmpty) {
      showToast("lastNameCannotBeEmpty".tr());
      return;
    }
    if (identityController.text.isEmpty) {
      showToast("identityCannotBeEmpty".tr());
      return;
    }
    if (identityController.text.length < 11) {
      showToast("identityNumberMinimumCharacter".tr());
      return;
    }
    if (salaryController.text.isEmpty) {
      showToast("salaryCannotBeEmpty".tr());
      return;
    }
    if (identity == false) {
      showToast("identityNumberError".tr());
      return;
    }
    var response = await AccountsApi().updateAccountById(
      id,
      AccountsDto(
        name: nameController.text,
        surname: surnameController.text,
        identity: identityController.text,
        phoneNumber: phoneController.text,
        birthDate: birthdateController.text,
        salary: double.parse(salaryController.text.isEmpty ? "0" : salaryController.text),
      ),
    );
    if (response) {
      showToast('updated'.tr());
      var account = _accountList.firstWhere((element) => element.id == id);
      _accountList.remove(account);
      loadAccountList();
      Navigator.pop(context);
    } else {
      showToast('error'.tr());
    }
    notifyListeners();
  }

  Future addAccount(BuildContext context) async {
    var identity = Tckn().check(identityController.text);

    if (nameController.text.isEmpty) {
      showToast("firstNameCannotBeEmpty".tr());
      return;
    }
    if (surnameController.text.isEmpty) {
      showToast("lastNameCannotBeEmpty".tr());
      return;
    }
    if (identityController.text.isEmpty) {
      showToast("identityCannotBeEmpty".tr());
      return;
    }
    if (identityController.text.length < 11) {
      showToast("identityNumberMinimumCharacter".tr());
      return;
    }
    if (salaryController.text.isEmpty) {
      showToast("salaryCannotBeEmpty".tr());
      return;
    }
    if (identity == false) {
      showToast("identityNumberError".tr());
      return;
    }
    var response = await AccountsApi().add(
      AccountsDto(
        name: nameController.text,
        surname: surnameController.text,
        identity: identityController.text,
        phoneNumber: phoneController.text,
        birthDate: birthdateController.text,
        salary: double.parse(salaryController.text.isEmpty ? "0" : salaryController.text),
      ),
    );

    if (response.isNotEmpty) {
      showToast('accountAddSuccessful'.tr());
      loadAccountList();
      Navigator.pop(context);
    } else {
      showToast('error'.tr());
    }
    notifyListeners();
  }
}
