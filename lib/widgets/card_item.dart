import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CardItem extends StatelessWidget {
  String title;
  String value;
  String icon;
  bool isDeath;

  CardItem(this.title, this.value, this.icon, this.isDeath);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 40),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 26),
        height: 144,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isDeath ? Color(0xffFFF2F2) : Color(0xffE8FBF7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              icon,
              width: 32,
              height: 32,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              title,
              style: GoogleFonts.asap(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: isDeath ? Color(0xff835B55) : Color(0xffE1C9578),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              value,
              style: GoogleFonts.asap(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: isDeath ? Color(0xff835B55) : Color(0xff1C9578),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
