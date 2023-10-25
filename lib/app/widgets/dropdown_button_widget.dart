import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownButtonWidget<T> extends StatefulWidget {
  const DropdownButtonWidget({
    super.key,
    required this.items,
    required this.hintText,
    required this.onTap,
    required this.value,
  });
  final List<DropdownMenuItem<T>> items;
  final String hintText;
  final Function(T)? onTap;
  final dynamic value;

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
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
        widget.hintText,
        style: const TextStyle(color: Colors.white),
      ),
      underline: Container(),
      iconStyleData: _buildIconStyleData(),
      items: widget.items,
      value: widget.value,
      onChanged: widget.onTap,
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
