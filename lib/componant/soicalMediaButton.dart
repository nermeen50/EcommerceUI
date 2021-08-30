import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_ecommerce/constants.dart';
import 'package:test_ecommerce/sizeConfig.dart';

class SoicalMediaButton extends StatelessWidget {
  final String imageName;
  final Color iconColor;
  const SoicalMediaButton({Key key, this.imageName, this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getPropertScreenWidth(50),
      height: getPropertScreenHeight(50),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: SvgPicture.asset(
        imageName,
        color: iconColor,
      ),
    );
  }
}
