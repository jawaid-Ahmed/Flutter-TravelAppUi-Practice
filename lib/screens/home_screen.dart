import 'package:flutrtertravelui/widgets/destination_carousel.dart';
import 'package:flutrtertravelui/widgets/hotel_carousel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}




class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  int currentTabIndex=0;

  List<IconData> _icons=[
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];


  Widget _buildIcons(int index){

    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex=index;
        });

      },
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: selectedIndex==index ? Color(0xFFD8ECF1)
              : Color(0xFFC4D2D5),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: selectedIndex==index ? Theme.of(context).primaryColor
              : Color(0xFF878E90),

        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children:[
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 120.0),
              child: Text('What would you like to find?',style:TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),),

            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                _icons.asMap().entries.map((MapEntry map) => _buildIcons(map.key),).toList(),
            ),
            SizedBox(height: 20.0,),
            DestinationCarousel(),
            SizedBox(height: 20.0,),
            HotelCarousel(),
          ],
        ),

      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTabIndex,
        onTap: (int value){
          setState(() {
            currentTabIndex=value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,size: 30.0,
              ),
              title:SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_pizza,
                size: 30.0,
              ),title:SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
            ),title:SizedBox.shrink(),),
        ],
      ),
    );
  }
}

