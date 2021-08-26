import 'package:flutrtertravelui/models/activity.dart';
import 'package:flutrtertravelui/models/destination.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  const DestinationScreen({Key? key,required this.destination}) : super(key: key);

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0,2.0),
                      blurRadius: 0.6,
                    ),
                  ],
                ),

                child: Hero(
                  tag: widget.destination.imageUrl,

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                        iconSize: 30.0,
                        color: Colors.white,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(FontAwesomeIcons.sortAmountDown),
                          iconSize: 25.0,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.destination.city,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          size: 15.0,
                          color: Colors.white70,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          widget.destination.country,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 25.0,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context,int index) {
                Activity activity=widget.destination.activities[index];
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                      height: 150.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:120.0,
                                  child: Text(activity.name,style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text('\$${activity.price}', style:TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                ),),

                              ],

                            ),

                            Text(activity.type,style:  TextStyle(
                             color: Colors.grey,
                            ),),
                            _buildRatingStars(index),
                            SizedBox(height: 10.0,),
                            Row(
                              children: [
                                Container(
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFC4D2D5),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(activity.startTimes[0]),
                                ),
                                SizedBox(width: 10.0,),
                                Container(
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFC4D2D5),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(activity.startTimes[1]),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 8.0,
                      top:5.0,
                      bottom:5.0,
                      child: ClipRRect(
                        borderRadius:BorderRadius.circular(10.0),
                        child:Image(
                          width:110.0,
                          image: AssetImage(activity.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                );
              }
            ),
          ),
        ],
      ),
    );
  }

  Text _buildRatingStars(int index) {
    String stars='';
    for(int i=-1; i<index; i++){
      stars +='⭐';
    }
    stars.trim();
    return Text(stars);
  }
}
