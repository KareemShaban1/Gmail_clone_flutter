import 'package:flutter/material.dart';
import 'package:gmail_clone/Data/mail_data.dart';
import 'package:gmail_clone/Widget/mails_widget.dart';



class MailPage extends StatefulWidget {
  MailPage({Key key}) : super(key: key);


  @override
  _MailPageState createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {

  @override
  Widget build(BuildContext context) {
    bool isExtended = false;

    return Scaffold(

      backgroundColor: Colors.white,
      body: new SafeArea(
        
        child: NestedScrollView(

          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {

            return <Widget>[

              PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: SliverAppBar(
                  toolbarHeight: 70,
                  pinned: false,
                  backgroundColor: Colors.white,
                  title: Container(
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Search in emails",
                            border: InputBorder.none,
                            icon: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Icon(Icons.dehaze)
                            ),
                            suffixIcon:
                            Container(
                              height: 5,
                              width: 5,
                              margin: EdgeInsets.all(5),
                              child: CircleAvatar(
                                radius: 14.0,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 14.0,
                                  backgroundColor: Colors.grey[200],
                                  backgroundImage: AssetImage("assets/profile1.jpg")
                                ),
                              ),
                            )

                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                    child: Text('PRIMARY'),
                  ),
                  Container(
                    child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: mailList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index){
                          return Container(
                            child: PrimaryWidget(mail: mailList[index],),
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
      ),
      //   floatingActionButton:Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Row(children: [
      //       Text("Compose"),
      //       Icon(FontAwesomeIcons.pen),
      //
      //
      //     ],),
      //   ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:FloatingActionButton.extended(
          backgroundColor: Colors.white,
            // onPressed: _onFabPress,
            label: AnimatedSwitcher(
              duration: Duration(seconds: 1),
              transitionBuilder: (Widget child, Animation<double> animation) =>
                  FadeTransition(
                    opacity: animation,
                    child: SizeTransition(child:
                    child,
                      sizeFactor: animation,
                      axis: Axis.horizontal,
                    ),
                  ) ,
              child: isExtended?
              Icon(Icons.arrow_forward):
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.create_outlined,size: 25,color: Colors.red,),
                  ),
                  Text("Compose",style: TextStyle(color: Colors.red),)
                ],
              ),
            )
        )

    );
  }
}
