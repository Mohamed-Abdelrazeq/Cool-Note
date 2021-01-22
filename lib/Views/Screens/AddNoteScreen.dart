import 'package:coolnote_app/Controllers/ColorProvider.dart';
import 'package:coolnote_app/Controllers/NotesViewController.dart';
import 'package:coolnote_app/Models/NoteModel.dart';
import 'package:coolnote_app/Models/NoteTableDBConnection.dart';
import 'package:coolnote_app/Views/ComponentWidgets/ColorDot.dart';
import 'package:coolnote_app/Views/GeneralWidgets/MultilineTextField.dart';
import 'package:coolnote_app/Views/GeneralWidgets/MyFloatingActionButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import '../ProjectConstants.dart';

TextEditingController headlineController = TextEditingController();
TextEditingController noteController = TextEditingController();

class AddNoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: mainWidget,
                          borderRadius: BorderRadius.circular(height * .02)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: mainText,
                          size: height * .045,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * .05,
                    ),
                    Text(
                      'Notes',
                      style: TextStyle(
                          fontSize: height * .065,
                          color: mainText,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            //Body
            Positioned(
              top: height * .17,
              left: width * .04,
              child: Container(
                width: width * .92,
                height: height * .83,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      width: width * .92,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(height),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                         GestureDetector(child: ColorDot(height: height,size: Provider.of<ColorProvider>(context).colorId == 0 ?  0.04 : 0.03,color: Colors.greenAccent,colorId: 0,),onTap: (){Provider.of<ColorProvider>(context,listen: false).colorChanger(0);}),
                         GestureDetector(child: ColorDot(height: height,size: Provider.of<ColorProvider>(context).colorId == 1 ?  0.04 : 0.03,color: Colors.redAccent,colorId: 1,),onTap: (){Provider.of<ColorProvider>(context,listen: false).colorChanger(1);}),
                         GestureDetector(child: ColorDot(height: height,size: Provider.of<ColorProvider>(context).colorId == 2 ?  0.04 : 0.03,color: Colors.blueAccent,colorId: 2,),onTap: (){Provider.of<ColorProvider>(context,listen: false).colorChanger(2);}),
                         GestureDetector(child: ColorDot(height: height,size: Provider.of<ColorProvider>(context).colorId == 3 ?  0.04 : 0.03,color: Colors.orangeAccent,colorId: 3,),onTap: (){Provider.of<ColorProvider>(context,listen: false).colorChanger(3);}),
                         GestureDetector(child: ColorDot(height: height,size: Provider.of<ColorProvider>(context).colorId == 4 ?  0.04 : 0.03,color: Colors.yellowAccent,colorId: 4,),onTap: (){Provider.of<ColorProvider>(context,listen: false).colorChanger(4);}),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    MultilineTextField(
                      myController: headlineController,
                      width: width,
                      height: height,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      hint: 'Headline',
                      myMaxLines: 3,
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    MultilineTextField(
                      myController: noteController,
                      width: width,
                      height: height,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      hint: 'What is in your mind?',
                      myMaxLines: 13,
                    ),
                    SizedBox(
                      height: height * .04,
                    ),
                  ],
                ),
              ),
            ),
            //FloatingActionButton
            Positioned(
              top: height * .88,
              child: GestureDetector(
                onTap: () async {
                  //AddNote
                  Database database = await noteTableDBConnection();
                  Note note = Note(headline: headlineController.text,date: dateCode(DateTime.now()),note: noteController.text,colorId: Provider.of<ColorProvider>(context,listen: false).colorId);
                  Provider.of<NotesViewController>(context,listen: false).insertNote(note, database);
                  //NotifyLister
                  Provider.of<NotesViewController>(context, listen: false).notesRow(width: width,height: height);
                  //CleanControllers
                  noteController.clear();
                  headlineController.clear();
                  //ResetColorProvider
                  Provider.of<ColorProvider>(context,listen: false).colorChanger(2);
                  //GoBack
                  Navigator.pop(context);
                },
                child: MyFloatingActionButton(
                  myHeight:height*.08 ,
                  myWidth: width*.5,
                  height: height,
                  width: width,
                  buttonColor: mainWidget,
                  iconColor: mainText,
                  shadowColor: Colors.grey,
                  icon: Icons.done,
                  text: 'Save Note',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//TODO find a place to it
String dateCode(DateTime now){
  var month = now.month;
  var day = now.day;
  var year = now.year;

  String stringMonth;

  if (month == 1){
    stringMonth = 'Jan';
  }
  else if(month == 2){
    stringMonth = 'Feb';
  }
  else if(month == 3){
    stringMonth = 'Mar';
  }
  else if(month == 4){
    stringMonth = 'Apr';
  }
  else if(month == 5){
    stringMonth = 'May';
  }
  else if(month == 6){
    stringMonth = 'June';
  }
  else if(month == 7){
    stringMonth = 'July';
  }
  else if(month == 8){
    stringMonth = 'Aug';
  }
  else if(month == 9){
    stringMonth = 'Sep';
  }
  else if(month == 10){
    stringMonth = 'Oct';
  }
  else if(month == 11){
    stringMonth = 'Nov';
  }
  else if(month == 12){
    stringMonth = 'Dec';
  }

  return "$stringMonth $day,$year";
}
