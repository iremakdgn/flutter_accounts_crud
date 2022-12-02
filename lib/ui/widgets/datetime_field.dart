import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DateTextField extends StatelessWidget {
  DateTextField(
      {Key? key,
      required TextEditingController textEditingController,
      required void Function(DateTime?)? onChanged,
      required String textTitle,
      required bool isRequired,
      DateTime? value,
      DateTime? firstDate,
      DateTime? lastDate})
      : textEditingController = textEditingController,
        textTitle = textTitle,
        isRequired = isRequired,
        value = value,
        onChanged = onChanged,
        super(key: key);

  final TextEditingController textEditingController;
  final String textTitle;
  final bool isRequired;
  final DateTime? value;
  final void Function(DateTime?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DateTimeField(
        controller: textEditingController,
        format: DateFormat("dd.MM.yyyy"),
        decoration: InputDecoration(
          labelText: textTitle,
        ),
        initialValue: value,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        onShowPicker: (context, currentValue) {
          return showDatePicker(
            context: context,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            initialDate: currentValue ?? DateTime.now(),
          );
        },
        onChanged: onChanged,
      ),
    ]);
  }
}
