import 'package:equatable/equatable.dart';
import 'package:flutter_neyasis_technical_case/shared/convert_helper.dart';
import 'package:flutter_neyasis_technical_case/shared/format_helper.dart';

dynamic accountsDtoListToJson(List<AccountsDto> data) => List<dynamic>.from(data.map((x) => x.toJson()));
List<AccountsDto> accountsDtoListFromJson(dynamic obj) => List<AccountsDto>.from(obj.map((x) => AccountsDto.fromJson(x)));

class AccountsDto extends Equatable {
  String? name;
  String? surname;
  String? birthDate;
  double? salary;
  String? phoneNumber;
  String? identity;
  String? id;

  AccountsDto({this.id, this.name, this.birthDate, this.identity, this.phoneNumber, this.salary, this.surname});

  factory AccountsDto.fromJson(Map<String, dynamic> json) => AccountsDto(
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        birthDate: FormatHelper.formatDate(json["birthDate"]),
        identity: json["identity"],
        phoneNumber: json["phoneNumber"],
        salary: ConvertHelper.convertToDouble(json["salary"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "surname": surname,
        "birthDate": birthDate,
        "identity": identity,
        "phoneNumber": phoneNumber,
        "salary": salary,
      };

  @override
  List<Object?> get props => [id, name, surname, birthDate, identity, phoneNumber, salary];
}
