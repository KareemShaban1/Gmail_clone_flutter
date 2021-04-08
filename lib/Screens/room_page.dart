import 'package:flutter/material.dart';

class RoomPage extends StatefulWidget {
  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {

  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Get a link that you can share",
      "subTitle":"Tap New meeting to get a link that\n you can send to people that you\n    want to meet with ",
      "image": "assets/image_1.jpg"
    },
    {
      "text": "Your meeting is safe",
      "subTitle":"No one can join a meeting unless\n invited or admitted by the host",
      "image": "assets/image_2.jpg"
    },

  ];

  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Scaffold(

          appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            leading: Icon(Icons.dehaze,color: Colors.black,),
            title: Text("Meet",style: TextStyle(color: Colors.black),),
            centerTitle: true,
            actions: [
              Container(

                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.green[800],
                  radius: 15.0,
                  child: Text('C', style: TextStyle(fontSize: 20, color: Colors.white,),),
                ),
              ),
            ],


       ),

          body: Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Column(
              children: [


                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20),
                    child: Row(
                      children: <Widget>[


                        SizedBox(
                          width: 180,
                          height: 40,

                          child: ElevatedButton(

                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[800]),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        side: BorderSide(color: Colors.blue[800])
                                    )
                                )
                            ),

                            child: Text(
                              "New Meeting",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        SizedBox(
                          width: 180,
                          height: 40,

                          child: ElevatedButton(

                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        side: BorderSide(color: Colors.blue[800])
                                    )
                                )
                            ),

                            child: Text(
                              "Join with a code",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue[800],
                              ),
                            ),
                          ),
                        ),



                      ],
                    ),
                  ),
                ),

                Expanded(
                  flex: 7,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Image.asset(
                          splashData[index]["image"],
                          height: 220,
                          width: 220,
                        ),

                        SizedBox(height: 20,),


                        Text(
                          splashData[index]["text"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              // fontWeight: FontWeight.bold
                          ),
                        ),

                        SizedBox(height: 20,),


                        Text(
                          splashData[index]["subTitle"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                            color: Colors.grey
                          ),
                        ),
                      ],
                    )
                  ),
                ),

                Expanded(
                  flex: 1,
                  child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    splashData.length,
                        (index) => buildDot(index: index),
                  ),
                ),)
              ],
            ),
          ),

    ));

  }
  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: currentPage == index ? 10 : 10,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.blue[700] : Colors.blue[100],

        // border: Border.all(
        //   color: currentPage == index ? Colors.grey[800] : Colors.black ,
        //
        // ),
        borderRadius: BorderRadius.circular(10),//Border.all


      ),
    );
  }
}
