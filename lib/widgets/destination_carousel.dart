import 'package:flutrtertravelui/models/destination.dart';
import 'package:flutrtertravelui/screens/destination_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Top Destinations',style:TextStyle(
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
          height: 240.0,
          color: Colors.white,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              itemBuilder: (BuildContext context,int index){
                Destination destination=destinations[index];
                return GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder:
                          (_) => DestinationScreen(destination: destination),)),
                  child: Container(
                    margin: EdgeInsets.all(7.0),
                    width: 120.0,
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
                              Text('${destination.activities.length} activities',style:
                              TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,

                                color: Colors.black,
                              ),
                              ),
                              Text(destination.description,style: TextStyle(
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
                          child: Stack(
                            children: [

                              Hero(
                                tag:destination.imageUrl,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image(
                                    height:140.0,
                                    width: 120.0,
                                    image: AssetImage(destination.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top:10.0,
                                left:10.0,
                                child: Text(destination.country,style:
                                TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                  color: Colors.white,
                                ),
                                ),

                              ),
                              Positioned(
                                top:35.0,
                                left:10.0,
                                child: Icon(
                                  FontAwesomeIcons.locationArrow,
                                  color: Colors.white,
                                  size:12.0,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );

              }),
        )
      ],
    );
  }
}
