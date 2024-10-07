import 'package:flutter/material.dart%20';

class ColorSelector extends StatefulWidget {
  final List<Color> colors;
  final Function(Color) onChange;
  const ColorSelector({super.key, required this.colors, required this.onChange});

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  Color? _selectedColor;
  @override
  void initState() {
    // TODO: implement initState
    _selectedColor=widget.colors.first;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.colors.map((c) => InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: (){
          _selectedColor=c;
          widget.onChange(c);
          if(mounted){
            setState(() {

            });
          }

        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(0,4,4,4),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: c,
            child: _selectedColor==c? Icon(Icons.done, color: Colors.white,):null,
          ),
        ),
      )).toList(),
    );
  }
}

