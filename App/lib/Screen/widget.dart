
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../model/list_item.dart';


class DropDown extends StatefulWidget {
  String hintText;
  String validatorText;
  List<ListItem> dropdownText;
  ValueChanged<int?> onChanged;

  DropDown(
      {Key? key,
        required this.hintText,
        required this.dropdownText,
        required this.validatorText,
        required this.onChanged})
      : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      isExpanded: true,
      hint: Text(
        widget.hintText,
        style: TextStyle(fontSize: 14),
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black45,
      ),
      iconSize: 30,
      buttonHeight: 60,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      items: widget.dropdownText
          .map((item) => DropdownMenuItem<int>(
        value: item.value,
        child: Text(
          item.type,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return widget.validatorText;
        }
      },
      onChanged: widget.onChanged,
    );
  }
}

class EditText extends StatefulWidget {
  TextEditingController controller;
  String hintText,levelText,validatorText;


  EditText({Key? key,
    required this.controller,
    required this.hintText,
    required this.levelText,
    required this.validatorText}) : super(key: key);

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: widget.hintText,
          labelText: widget.levelText),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      validator: (value){
        if(value == null || value.isEmpty){
          return widget.validatorText;
        }
        else if(double.parse(value)<1||double.parse(value)>10){
          return widget.validatorText;
        }
        return null;
      },

    );
  }
}

