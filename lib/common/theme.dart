import 'package:flutter/material.dart';


Color primaryColor = const Color(0xFF6096FF);
Color primaryDark = const Color(0xff1f49d3);
Color secondaryColor = const Color(0xFFF4F8FB);
Color accentColor = const Color(0xFFFF8181);
Color accentColor2 = const Color(0xFF7DC579);
Color accentColor3 = const Color(0xFFFFC960);
Color disableColor = const Color(0xff91919F);

Color alertColor = const Color(0xffED6363);
Color priceColor = const Color(0xff2C96F1);
Color bgColor1 = const Color(0xFFF1F1FA);
Color bgColor2 = const Color(0xff2C96F1);
Color bgColor3 = const Color(0xffFCFCFF);
Color bgColor4  = const Color(0xff252836);
Color bgColor5  = const Color(0xff2b2844);
Color bgColor6  = const Color(0xffECEDEF);

Color primaryTextColor = const Color(0xff2C96F1);
Color secondaryTextColor = const Color(0xffffffff);
Color hintTextColor = const Color(0xff91919F);
Color greyTextColor = const Color(0xff646464);
Color blackTextColor = const Color(0xff343434);

Color subtitleTextColor = const Color(0xED505050);

Color transparentColor = Colors.transparent;
Color blackColor = const Color(0xff000000);

Color startColor = const Color(0xFFFFC960);
TextStyle primaryTextStyle =
    TextStyle(
        fontFamily: 'Poppins',
        color: primaryTextColor,
        fontSize: 14,
    );
TextStyle secondaryTextStyle =
    TextStyle(
        fontFamily: 'Poppins',
        color: secondaryTextColor,
        fontSize: 14,
    );
TextStyle thirdTextStyle =
    TextStyle(
        fontFamily: 'Poppins',
        color: greyTextColor,
        fontSize: 14,
    );

TextStyle headerTextStyle =
TextStyle(
    fontFamily: 'Poppins',
    color: secondaryColor,
    fontSize: 24,
);

TextStyle subtitleTextStyle =
    TextStyle(
        fontFamily: 'Poppins',
        color: subtitleTextColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
    );

TextStyle subtitleTextStyle2 =
    TextStyle(
        fontFamily: 'Poppins',
        color: subtitleTextColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
    );

TextStyle normalTextStyle =
TextStyle(
    fontFamily: 'Poppins',
    color: blackTextColor,
    fontSize: 14,
);

TextStyle accentTextStyle =
TextStyle(
    fontFamily: 'Poppins',
    color: accentColor,
    fontSize: 14,
);

TextStyle accentTextStyle2 =
TextStyle(
    fontFamily: 'Poppins',
    color: accentColor2,
    fontSize: 14,
);

TextStyle hintTextStyle =
TextStyle(
    fontFamily: 'Poppins',
    color: hintTextColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
);

TextStyle linkTextStyle =
    TextStyle(fontFamily: 'Poppins', color: priceColor);

TextStyle blackTextStyle =
    TextStyle(fontFamily: 'Poppins', color: blackColor);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

extension HexColor on Color {
    static Color fromHex(String hexString) {
        final buffer = StringBuffer();
        if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
        buffer.write(hexString.replaceFirst('#', ''));
        return Color(int.parse(buffer.toString(), radix: 16));
    }

    String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
        '${alpha.toRadixString(16).padLeft(2, '0')}'
        '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}';
}