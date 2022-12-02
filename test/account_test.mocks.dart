// Mocks generated by Mockito 5.3.2 from annotations
// in flutter_accounts_crud/test/account_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_accounts_crud/api/accounts_api.dart' as _i3;
import 'package:flutter_accounts_crud/model/accounts_dto.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAccountsDto_0 extends _i1.SmartFake implements _i2.AccountsDto {
  _FakeAccountsDto_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AccountsApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockAccountsApi extends _i1.Mock implements _i3.AccountsApi {
  MockAccountsApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.AccountsDto> getById(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getById,
          [id],
        ),
        returnValue: _i4.Future<_i2.AccountsDto>.value(_FakeAccountsDto_0(
          this,
          Invocation.method(
            #getById,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.AccountsDto>);
  @override
  _i4.Future<List<_i2.AccountsDto>> getListByPaging(
    int? page,
    int? limit,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getListByPaging,
          [
            page,
            limit,
          ],
        ),
        returnValue:
            _i4.Future<List<_i2.AccountsDto>>.value(<_i2.AccountsDto>[]),
      ) as _i4.Future<List<_i2.AccountsDto>>);
  @override
  _i4.Future<bool> deleteAccountById(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteAccountById,
          [id],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<bool> updateAccountById(
    String? id,
    _i2.AccountsDto? model,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateAccountById,
          [
            id,
            model,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<String> add(_i2.AccountsDto? model) => (super.noSuchMethod(
        Invocation.method(
          #add,
          [model],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<String> get(String? url) => (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<String> post(
    String? url,
    dynamic obj,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [
            url,
            obj,
          ],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<bool> put(
    String? url,
    dynamic obj,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [
            url,
            obj,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<bool> delete(String? url) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}
