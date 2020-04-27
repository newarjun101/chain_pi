import 'package:carousel_pro/carousel_pro.dart';
import 'package:chain_pi/Models/agents_detail_model.dart';
import 'package:chain_pi/Models/logo_request_model.dart';
import 'package:chain_pi/Models/note.dart';
import 'package:chain_pi/ui/logo_request.dart';
import 'package:chain_pi/ui/note_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavHomePage extends StatefulWidget {
  @override
  _BottomNavHomePageState createState() => _BottomNavHomePageState();
}

class _BottomNavHomePageState extends State<BottomNavHomePage> {

  // LogoRequestModel logoRequestModel;

  List agentInfo = [
    AgentsDetailModel("images/developer.png","Hello World"),
    AgentsDetailModel("images/developer.png","Hello World"),
    AgentsDetailModel("images/developer.png","Hello World"),
    AgentsDetailModel("images/developer.png","Hello World"),

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                //This is For Image Slider (Casrousel)
                Container(

                    height: MediaQuery.of(context).size.height/4,
                    child: Carousel(
                      images: [


                        NetworkImage(

                            'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',),
                       // NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Flinmyanmarproperty.com%2Fen%2Fuser%2Fpost%2Fdetail%2Fpage%2F2449&psig=AOvVaw1k7M-FAj8MSTGQYvBgo1Fh&ust=1587221894567000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCOj12rzc7-gCFQAAAAAdAAAAABAD'),
                        NetworkImage(
                            'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
                      ],
                      boxFit: BoxFit.fill,
                      dotBgColor: Colors.transparent,
                      dotSize: 6.0,
                      dotSpacing: 15.0,
                      indicatorBgPadding: 0.0,
                      borderRadius: false,
                      moveIndicatorFromBottom: 180.0,
                      noRadiusForIndicator: true,
                     // overlayShadow: true,
                      overlayShadowColors: Colors.white,
                      overlayShadowSize: 0.7,
                    )),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        child: Card(

                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.only(left:10,right: 10,top: 10,),
                            width: 80,
                            height: 100,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.only(top: 5,left: 5,right: 5,bottom: 5),
                                    child: Image.asset('images/video_editing.png',width: 50,height:50,fit: BoxFit.fill,)),
                                Padding(

                                  padding: const EdgeInsets.only(bottom: 2),
                                  child: Text("Video Editing"),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LogoRequest(LogoRequestModel(null,null,null,null))),
                            );
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(left:10,right: 10,top: 10,),
                          width: 80,
                          height: 100,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(top: 5,left: 5,right: 5,bottom: 5),
                                  child: Image.asset('images/developer.png',width: 50,height: 50,fit: BoxFit.fill,)),
                              Padding(

                                padding: const EdgeInsets.only(bottom: 2),
                                child: Text("Developer"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(left:10,right: 10,top: 10,),
                          width: 80,
                          height: 100,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(top: 5,left: 5,right: 5,bottom: 5),
                                  child: Image.asset('images/editing.png',width: 50,height: 50,fit: BoxFit.fill,)),
                              Padding(

                                padding: const EdgeInsets.only(bottom: 2),
                                child: Text("Computer Graphic",style: TextStyle(fontSize: 12,),textAlign: TextAlign.center,)
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Card(
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(left:10,right: 10,top: 10),
                          width: 80,
                          height: 100,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(top: 5,left: 5,right: 5,bottom: 5),
                                  child: Image.asset('images/tutor.png',width: 50,height: 50,fit: BoxFit.fill,)),
                              Padding(

                                padding: const EdgeInsets.only(bottom: 2),
                                child: Text("IT Tutor"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(left:10,right: 10,top: 10),
                          width: 80,
                          height: 100,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(top: 5,left: 5,right: 5,bottom: 5),
                                  child: Image.asset('images/presentation.png',width: 50,height: 50,fit: BoxFit.fill,)),
                              Padding(

                                padding: const EdgeInsets.only(bottom: 2),
                                child: Text("Presentation"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(left:10,right: 10,top: 10),
                          width: 80,
                          height: 100,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(top: 5,left: 5,right: 5,bottom: 5),
                                  child: Image.asset('images/translator.png',width: 50,height: 50,fit: BoxFit.fill,)),
                              Padding(

                                padding: const EdgeInsets.only(bottom: 2),
                                child: Text("Translator"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Text("Recent Agend"),
                ),
                
                Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      shrinkWrap: false,
                      itemCount: agentInfo.length,
                      itemBuilder: (BuildContext context, int indext){
                        return Card(

                          elevation: 5,
                          child: Container(
                            width: MediaQuery.of(context).size.width/2.5,
                            padding: EdgeInsets.all(3),
                            child: Stack(

                              children: <Widget>[
                                Container(
                                    child: Image.asset(agentInfo[indext].agentImage,width: 100,height: 100,)),
                                Container(
                                  color: Colors.white12,
                                  alignment: Alignment.bottomCenter,
                                  child: Text(agentInfo[indext].agentDescription,style: TextStyle(color: Colors.blue),),
                                )

                              ],
                            ),
                          ),
                        );
                      }),
                )




              ],
            ),
          ],
        ),
      ),
    );
  }
}
