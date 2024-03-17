import 'package:flutter/material.dart';
import '../../../core/utils/values/colors.dart';

import 'package:flutter/material.dart';

import '../../utils/models/carModels.dart';
import '../../utils/models/carsExamples.dart';

class DropdownMenuExample extends StatefulWidget {
  final String? value;
  final List<String> items;
  final ValueChanged<String?>? onChanged;

  const DropdownMenuExample({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: secondaryColor, width: 1.0),
          ),
          child: DropdownButton<String>(
            dropdownColor: primaryColor,
            value: widget.value,
            icon: const Icon(Icons.arrow_drop_down, color: secondaryColor),
            iconSize: 30,
            elevation: 16,
            isExpanded: true,
            underline: Container(
              height: 0,
              color: Colors.transparent,
            ),
            onChanged: widget.onChanged,
            items: widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    color: secondaryColor,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
