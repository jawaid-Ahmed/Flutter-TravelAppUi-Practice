import 'package:flutrtertravelui/models/destination.dart';
import 'package:flutrtertravelui/models/hotel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Exclusive Hotels',style:TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),),
              Text('See All',style:TextStyle(
                fontSize: 16.0,
                color: Colors.cyan,
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
              ),),
            ],                ),
        ),
        Container(
          height: 200.0,
          color: Colors.white,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (BuildContext context,int index){
                Hotel hotel=hotels[index];
                return Container(
                  margin: EdgeInsets.all(7.0),
                  width: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],//Color(0xFFC4D2D5),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),

                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(hotel.name,style:
                            TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,

                              color: Colors.black,
                            ),
                            ),
                            Text(hotel.address,style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                            ),),

                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0,2.0),
                                blurRadius: 6.0,
                              ),
                            ]

                        ),

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image(
                            height:140.0,
                            width: 200.0,
                            image: AssetImage(hotel.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),

                      )
                    ],
                  ),
                );

              }),
        )
      ],
    );
    ;
  }
}
