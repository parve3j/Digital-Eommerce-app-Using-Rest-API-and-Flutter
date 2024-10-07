import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';

class ProductImageCaurosel extends StatefulWidget {
  final double? height;
  final List<String> urls;
  const ProductImageCaurosel({
    super.key,
    this.height,
    required this.urls,
  });

  @override
  State<ProductImageCaurosel> createState() => _ProductImageCauroselState();
}

class _ProductImageCauroselState extends State<ProductImageCaurosel> {
  ValueNotifier<int> _index = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height?? 220.0,
            onPageChanged: (index, reason){
              _index.value=index;

            },
            viewportFraction: 1,
            autoPlay: true,
          ),
          items: widget.urls.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(i)
                      )
                    ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: ValueListenableBuilder(
            valueListenable: _index,
            builder: (context, index, _){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i=0;i<widget.urls.length;i++)
                    Container(
                      height: 14,
                      width: 14,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: i== index? Colors.teal: Colors.white,
                        border: Border.all(
                          color: i== index? Colors.teal: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
