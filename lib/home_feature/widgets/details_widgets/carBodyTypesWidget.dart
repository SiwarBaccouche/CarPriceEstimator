import 'package:flutter/material.dart';
import '../../../core/utils/values/colors.dart';

class CustomButtonList extends StatefulWidget {
  final List<String> items;
  final String selectedItem;
  final void Function(String) onItemSelected;

  CustomButtonList({
    required this.items,
    required this.selectedItem,
    required this.onItemSelected,
  });

  @override
  _CustomButtonListState createState() => _CustomButtonListState();
}

class _CustomButtonListState extends State<CustomButtonList> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: widget.items.map((type) {
        return ElevatedButton(
          onPressed: () {
                      setState(() {
              widget.onItemSelected(type);
              // Call the onItemSelected function with the selected item
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.selectedItem == type ? secondaryColor : primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: secondaryColor),
            ),
            elevation: 5,
          ),
          child: Text(
            type,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              color: widget.selectedItem == type ? primaryColor : Colors.white,
            ),
          ),
        );
      }).toList(),
    );
  }
}
