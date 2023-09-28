import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({
    super.key,
    required this.items,
    required this.hintText,
  });
  final dynamic items;
  final String hintText;

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      alignment: Alignment.center,
      menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.zero),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'Cousine',
      ),
      dropdownStyleData: const DropdownStyleData(
        decoration: BoxDecoration(color: Colors.amber),
      ),
      hint: Text(
        selectedValue ?? widget.hintText,
        style: const TextStyle(color: Colors.white),
      ),
      underline: Container(),
      iconStyleData: _buildIconStyleData(),
      items: widget.items,
      value: selectedValue,
      onChanged: (String? value) {
        setState(() {
          selectedValue = value;
        });
      },
    );
  }

  IconStyleData _buildIconStyleData() {
    return const IconStyleData(
      icon: Icon(Icons.keyboard_arrow_down_rounded),
      iconSize: 20,
      iconDisabledColor: Colors.white,
      iconEnabledColor: Colors.white,
    );
  }
}
