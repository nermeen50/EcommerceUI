import 'package:flutter/material.dart';
import 'package:test_ecommerce/constants.dart';

class DefultCard extends StatelessWidget {
  final String imagePath, textTitle, subTitle;
  final width, height;
  const DefultCard(
      {Key key,
      this.imagePath,
      this.textTitle,
      this.subTitle,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.darken),
                fit: BoxFit.cover,
                image: AssetImage(
                  imagePath,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10.0,
            left: 5.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textTitle,
                  style: TextStyle(color: whiteColor, fontSize: 30),
                ),
                Text(subTitle, style: TextStyle(color: whiteColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
