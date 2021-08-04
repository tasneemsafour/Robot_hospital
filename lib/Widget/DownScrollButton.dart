import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  //const DropDownButton({ Key? key }) : super(key: key);
  List item;
  String valueChoose;
  DropDownButton({this.item, this.valueChoose});
  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton(
        hint: Text("selectItem"),
        dropdownColor: Colors.white,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 36,
        isExpanded: true,
        underline: SizedBox(),
        style: TextStyle(color: Colors.black, fontSize: 22),
        value: widget.valueChoose,
        onChanged: (newValue) {
          setState(() {
            widget.valueChoose = newValue;
          });
        },
        items: widget.item.map((valItem) {
          return DropdownMenuItem(child: Text(valItem), value: valItem);
        }).toList(),
      ),
    );
  }
}
