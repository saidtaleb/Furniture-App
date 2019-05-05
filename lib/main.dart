import 'package:flutter/material.dart';
import 'custon_icon.dart';
import 'data.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  Widget _buildGradientContainer(double width, double height) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: width * .8,
        height: height / 2,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFfbfcfd), Color(0xFF2f3f8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 1.0])),
      ),
    );
  }

  Widget _buildAppBar() {
    return Positioned(
      top: 40.0,
      left: 20.0,
      right: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(CustomIcon.menu, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(CustomIcon.search, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _buildTitle(double height) {
    return Positioned(
      top: height * .2,
      left: 30.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Wooden Armchair",
              style: TextStyle(fontSize: 28.0, fontFamily: "Montserrat-Bold")),
          Text("Lorem Ipsem",
              style: TextStyle(fontSize: 16.0, fontFamily: "Montserrat-Medium"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f3f8),
      body: LayoutBuilder(
        builder: (context, constraints) {
          var height = constraints.maxHeight;
          var width = constraints.maxWidth;

          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _buildGradientContainer(width, height),
              _buildAppBar(),
              _buildTitle(height),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: height * .6,
                  child: ListView.builder(
                    itemCount: images.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 35.0, bottom: 60.0),
                        child: SizedBox(
                          width: 200,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 45.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: (index % 2 == 0)
                                          ? Colors.white
                                          : Color(0xFF2a2d3a),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0.0, 10.0),
                                            blurRadius: 10.0)
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    images[index],
                                    width: 172.5,
                                    height: 199.0,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          title[index],
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontFamily: "Montserrat-Medium",
                                              color: (index % 2 == 0)
                                                  ? Color(0xFF2a2d3a)
                                                  : Colors.white),
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                          "NEW SELL",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontFamily: "Montserrat-Medium",
                                              color: (index % 2 == 0)
                                                  ? Color(0xFF2a2d3a)
                                                  : Colors.white),
                                        ),
                                        SizedBox(height: 50.0),
                                        Text(
                                          price[index] + " \$",
                                          style: TextStyle(
                                            fontFamily: "Montserrat-Bold",
                                            fontSize: 30.0,
                                            color: (index % 2 == 0)
                                                ? Color(0xFF2a2d3a)
                                                : Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.panorama_horizontal),
              title: Container(
                height: 0.0,
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              title: Container(
                height: 0.0,
              ))
        ],
      ),
      floatingActionButton: Container(
        width: 65.0,
        height: 65.0,
        decoration: BoxDecoration(
            color: Color(0xFFfa7b58),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Color(0xFFf78a6c).withOpacity(0.6),
                  offset: Offset(0.0, 10.0),
                  blurRadius: 10.0),
            ]),
        child: RawMaterialButton(
          shape: CircleBorder(),
          child: Icon(
            Icons.add,
            size: 35.0,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
