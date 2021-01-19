import 'package:coolnote_app/Models/NoteModel.dart';
import 'package:coolnote_app/Views/GeneralWidgets/MultilineTextField.dart';
import 'package:coolnote_app/Views/GeneralWidgets/MyFloatingActionButton.dart';
import 'package:flutter/material.dart';
import '../ProjectConstants.dart';

var fido = Note(
  id: 0,
  headline: 'test',
  note: 'working',
  date: 'today',
);

class AddNoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    TextEditingController headlineController = TextEditingController();
    TextEditingController noteController = TextEditingController();

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
              onTap: () {
                Navigator.pop(context);
              },
              child: MyFloatingActionButton(
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
    );
  }
}
