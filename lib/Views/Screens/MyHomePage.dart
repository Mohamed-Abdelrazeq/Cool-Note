import 'package:flutter/material.dart';
import '../GeneralWidgets/MyFloatingActionButton.dart';
import '../ProjectConstants.dart';
import '../ComponentWidgets/NoteCard.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
                    children: [
                      Column(
                        children: [
                          NoteCard(
                            width: width,
                            height: height,
                            date: 'May 21,2020',
                            headline:
                            'How to make your personal brand stand out online',
                            color: Colors.orange,
                          ),
                          NoteCard(
                            width: width,
                            height: height,
                            date: 'May 21,2020',
                            headline:
                            'Beautiful weather app UI concept we wish existed just to make you satisfied',
                            color: Colors.blue,
                          ),
                          NoteCard(
                            width: width,
                            height: height,
                            date: 'May 21,2020',
                            headline:
                            'Beautiful weather app UI concept we wish existed just to make you satisfied',
                            color: Colors.lightGreenAccent,
                          ),
                          NoteCard(
                            width: width,
                            height: height,
                            date: 'May 21,2020',
                            headline:
                            'How to make your personal brand stand out online',
                            color: Colors.redAccent,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width * .04,
                      ),
                      Column(
                        children: [
                          NoteCard(
                            width: width,
                            height: height,
                            date: 'May 21,2020',
                            headline:
                            'Beautiful weather app UI concept we wish existed just to make you satisfied',
                            color: Colors.lightGreenAccent,
                          ),
                          NoteCard(
                            width: width,
                            height: height,
                            date: 'May 21,2020',
                            headline:
                            'How to make your personal brand stand out online',
                            color: Colors.redAccent,
                          ),
                          NoteCard(
                            width: width,
                            height: height,
                            date: 'May 21,2020',
                            headline:
                            'How to make your personal brand stand out online',
                            color: Colors.orange,
                          ),
                          NoteCard(
                            width: width,
                            height: height,
                            date: 'May 21,2020',
                            headline:
                            'Beautiful weather app UI concept we wish existed just to make you satisfied',
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ],
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
  }
}
