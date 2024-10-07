import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  final List<String> sizes;
  final Function(String) onChange;
  const SizeSelector({super.key, required this.sizes, required this.onChange});

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late String _selectedSize;
  @override
  void initState() {
    // TODO: implement initState
    _selectedSize=widget.sizes.first;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.sizes.map((c) => InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: (){
          _selectedSize=c;
          widget.onChange(c);
          if(mounted){
            setState(() {

            });
          }

        },
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: Colors.grey,
            ),
            color: c==_selectedSize? Colors.teal: null,

          ),
          child: Text(c, style: TextStyle(
              color: c==_selectedSize? Colors.white: Colors.black54
          ),),
        ),
      )).toList(),
    );
  }
}