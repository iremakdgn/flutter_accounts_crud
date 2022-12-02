import 'dart:async';
import 'dart:convert';

import 'package:flutter_accounts_crud/model/accounts_dto.dart';

import 'base_api.dart';

class AccountsApi extends BaseApi {
  Future<AccountsDto> getById(String id) async {
    var result = await get("accounts/$id");
    return AccountsDto.fromJson(json.decode(result));
  }

  Future<List<AccountsDto>> getListByPaging(int page, int limit) async {
    var result = await get("accounts?page=$page&limit=$limit");
    if (result == null || result.isEmpty) return <AccountsDto>[];
    return accountsDtoListFromJson(json.decode(result));
  }

  Future<bool> deleteAccountById(String id) async {
    var result = await delete("accounts/$id");
    return result;
  }

  Future<bool> updateAccountById(String id, AccountsDto model) async {
    var result = await put("accounts/$id", model.toJson());
    return result;
  }

  Future<String> add(AccountsDto model) async {
    var result = await post("accounts", model.toJson());
    return result;
  }
}
