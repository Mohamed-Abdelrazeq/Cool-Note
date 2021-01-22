import 'package:coolnote_app/Controllers/NotesViewController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../GeneralWidgets/MyFloatingActionButton.dart';
import '../ProjectConstants.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: Provider.of<NotesViewController>(context, listen: false).notesRow(width: width,height: height),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Scaffold(
          backgroundColor: Color(0xff101010),
          body: Stack(
            children: [
              //TopBar
              Positioned(
                top: height * .07,
                child: Container(
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: width * .04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Notes',
                        style: TextStyle(
                            fontSize: height * .065,
                            color: mainText,
                            fontWeight: FontWeight.w300),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: mainWidget,
                            borderRadius: BorderRadius.circular(height * .02)),
                        child: Icon(
                          Icons.search,
                          color: mainText,
                          size: height * .045,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Body
              Positioned(
                top: height * .17,
                child: Container(
                  width: width,
                  height: height * .83,
                  padding: EdgeInsets.symmetric(horizontal: width * .04),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: Provider.of<NotesViewController>(context, listen: true).myNoteCards
                      ),
                      SizedBox(
                        height: height * .02,
                      )
                    ],
                  ),
                ),
              ),
              //FloatingActionButton
              Positioned(
                top: height * .88,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/AddNoteScreen');
                  },
                  child: MyFloatingActionButton(
                    myHeight:height*.08 ,
                    myWidth: width*.5,
                    height: height,
                    width: width,
                    buttonColor: mainWidget,
                    iconColor: mainText,
                    shadowColor: Colors.grey,
                    icon: Icons.add,
                    text: 'AddNote',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


