import 'package:flutter/material.dart';
import 'Constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: width * .08, right: width * .08),
      height: height * .08,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * .05),
            width: width * .64,
            height: .1 * height,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(height * .02)),
            child: Center(
              child: TextField(
                  cursorColor: Colors.black87,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    icon: Icon(
                      Icons.search,
                      color: Colors.black87,
                    ),
                    hintText: 'Search',
                  )),
            ),
          ),
          SizedBox(
            width: width * .02,
          ),
          Container(
            width: width * .16,
            height: .1 * height,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(height * .02)),
            child: Icon(
              Icons.settings,
              size: height * .04,
              color: cOldBurgundy,
            ),
          )
        ],
      ),
    );
  }
}
