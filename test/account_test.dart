import 'package:flutter_accounts_crud/api/accounts_api.dart';
import 'package:flutter_accounts_crud/model/accounts_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'account_test.mocks.dart';

@GenerateMocks([AccountsApi])
void main() {
  MockAccountsApi mockAccountsApi = MockAccountsApi();

  test('Add account successfully', () async {
    when(
      mockAccountsApi.add(any),
    ).thenAnswer(
      (inv) => Future.value("{id: " "1" ", name: " "İrem" "}"),
    );

    await mockAccountsApi.add(AccountsDto(id: "1", name: "İrem"));

    verify(await mockAccountsApi.add(AccountsDto(id: "1", name: "İrem")));
  });

  test('Update account successfully', () async {
    when(mockAccountsApi.put(any, any)).thenAnswer((realInvocation) => Future.value(true));

    await mockAccountsApi.put('accounts/1', AccountsDto(id: "1", name: "Ayşe"));

    verify(await mockAccountsApi.put('accounts/1', AccountsDto(id: "1", name: "Ayşe")));
  });

  test('Delete account successfully', () async {
    when(mockAccountsApi.delete(any)).thenAnswer((realInvocation) => Future.value(true));

    await mockAccountsApi.delete('accounts/1');

    verify(await mockAccountsApi.delete('accounts/1'));
  });

  test('Get account by id successfully', () async {
    when(mockAccountsApi.getById(any)).thenAnswer((realInvocation) => Future.value(AccountsDto(id: "1", name: "İrem")));

    var result = await mockAccountsApi.getById('1');

    verify(await mockAccountsApi.getById('1'));
    expect(result.id, "1");
    expect(result.name, "İrem");
  });

  test('Get list account by paging successfully', () async {
    when(mockAccountsApi.getListByPaging(any, any)).thenAnswer((realInvocation) => Future.value([]));

    var result = await mockAccountsApi.getListByPaging(1, 1);

    verify(await mockAccountsApi.getListByPaging(1, 1));
    expect(result.length, 0);
  });
}
