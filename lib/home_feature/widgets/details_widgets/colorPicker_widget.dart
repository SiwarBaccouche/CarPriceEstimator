import 'package:flutter/material.dart';

class CarColorPicker extends StatefulWidget {
  final List<Color> colors;
  final Function(Color)? onColorSelected;

  CarColorPicker({required this.colors, this.onColorSelected});

  @override
  _CarColorPickerState createState() => _CarColorPickerState();
}

class _CarColorPickerState extends State<CarColorPicker> {
  late Color selectedColor;
  bool isSpecialButtonSelected = false;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.colors.first;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        ...List.generate(
          widget.colors.length,
              (index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedColor = widget.colors[index];
                isSpecialButtonSelected = false; // Deselect special button
              });
              if (widget.onColorSelected != null) {
                widget.onColorSelected!(selectedColor);
              }
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.colors[index],
                border: selectedColor == widget.colors[index]
                    ? Border.all(color: Colors.deepOrangeAccent, width: 3.0)
                    : null,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isSpecialButtonSelected = true; // Select special button
              selectedColor = Colors.deepOrangeAccent; // Set the color to special color
              if (widget.onColorSelected != null) {
                widget.onColorSelected!(selectedColor);
              }
            });
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSpecialButtonSelected ? Colors.deepOrangeAccent : null,
              border: Border.all(color:  isSpecialButtonSelected ? Colors.black : Colors.white, width: 1.0),
            ),
            child: Center(
              child: Text(
                '+',
                style: TextStyle(fontSize: 20, color:  isSpecialButtonSelected ? Colors.black : Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
