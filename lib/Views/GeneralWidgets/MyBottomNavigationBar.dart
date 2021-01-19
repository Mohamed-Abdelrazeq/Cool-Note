//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Constants
import 'Constants.dart';
//Providers
import 'package:coolnote_app/Controllers/PageProvider.dart';

class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar({
    @required this.height,
    @required this.width,
  });

  final double height;
  final double width;

  final int tranDuration = 200;//TODO

  final Color notSelectedColor = cShadow;
  final Color selectedColor = cSmithApple;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: height * 0.91,
      left: 0,
      child: Container(
        height: height * .09,
        width: width,
        color: Colors.white,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){
                  Provider.of<PageProvider>(context,listen: false).pageController.animateToPage(
                    0,
                    duration: Duration(milliseconds: tranDuration),
                    curve: Curves.easeInOut,
                  );
                },
                  child: Icon(
                Icons.home,
                size: height * .045,
                color: Provider.of<PageProvider>(context,).pageNumber == 0 ? selectedColor : notSelectedColor
              )),
              GestureDetector(
                onTap: (){
                  Provider.of<PageProvider>(context,listen: false).pageController.animateToPage(
                    1,
                    duration: Duration(milliseconds: tranDuration),
                    curve: Curves.easeInOut,
                  );
                },
                child: Icon(
                  Icons.pets,
                  size: height * .045,
                    color: Provider.of<PageProvider>(context,).pageNumber == 1 ? selectedColor : notSelectedColor
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
