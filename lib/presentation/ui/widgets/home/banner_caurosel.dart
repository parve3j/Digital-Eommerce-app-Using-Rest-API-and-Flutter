import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/banner.dart';
class BannerCauroselWidget extends StatefulWidget {
  final double? height;
  List<Banners> bannerList;
   BannerCauroselWidget({
    super.key,
    this.height,
    required this.bannerList
  });

  @override
  State<BannerCauroselWidget> createState() => _BannerCauroselWidgetState();
}

class _BannerCauroselWidgetState extends State<BannerCauroselWidget> {
  final ValueNotifier<int> _currentIndex= ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: widget.height?? 180.0,
            onPageChanged: (index, reason){
              _currentIndex.value=index;
            },
            viewportFraction: 1,
            autoPlay: true,
          ),
          items: widget.bannerList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(
                                i.image??'',
                              ),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(i.title??'',style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 150,
                            child: Text(
                              maxLines: 3,
                              overflow: TextOverflow.fade,
                              i.shortDes??'',style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                            ),),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          }).toList(),
        ),
        ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (context, index, _)=>
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i=0; i<widget.bannerList.length; i++)
                Container(
                  height: 14,
                  width: 14,
                  margin:const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: i==index? Colors.teal: Colors.white,
                    border: Border.all(
                      color: i==index? Colors.teal: Colors.grey
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
