import 'package:coolnote_app/Controllers/NotesViewController.dart';
import 'package:coolnote_app/Views/ProjectConstants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatelessWidget {

  const NoteScreen({
    @required this.headline,
    @required this.id,
    @required this.note,
  });

  final String headline;
  final String note;
  final int id;

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
            left: width*.05,
            child: Container(
              width: width*.9,
              height: height*.93,
              padding: EdgeInsets.symmetric(horizontal: width * .04),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Text(
                    headline,
                    style:TextStyle(color: Colors.white, fontSize: 36) ,
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Container(
                    child: Divider(color: Colors.white,),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Text(
                    note,
                    style:TextStyle(color: Colors.white.withOpacity(.95), fontSize: 24) ,
                  ),
                  SizedBox(
                    height: height * .14,
                  ),
                ],
              ),
            ),
          ),
          //FloatingActionButton
          Positioned(
              top: height * .88,
              left: 0,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * .1,
                    width: width * .8,
                    padding: EdgeInsets.symmetric(vertical: height * .01),
                    decoration: BoxDecoration(
                      color: mainWidget,
                      borderRadius: BorderRadius.circular(height),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.done_all,
                                color: Colors.white,
                                size: height * .05,
                              ),
                              Text(
                                'Done',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * .03,
                        ),
                        GestureDetector(
                          onTap: () async {
                            Provider.of<NotesViewController>(context,listen: false).deleteNote(id);
                            Provider.of<NotesViewController>(context, listen: false).notesRow(width: width,height: height);
                            Navigator.pop(context);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: height * .05,
                              ),
                              Text(
                                'Delete',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
