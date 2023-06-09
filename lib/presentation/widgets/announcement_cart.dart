import 'package:codelytic/common/dimens.dart';
import 'package:flutter/material.dart';
import 'package:codelytic/common/theme.dart';

class AnnouncementCart extends StatelessWidget {
  const AnnouncementCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.only(
          right: Dimens.defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bgColor2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container()),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text(
                    'Lorem Ipsum werhekwhrkewhrhewkhhrewhr',
                    style: subtitleTextStyle2.copyWith(
                      color: secondaryTextColor
                    ),

                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6,),
                  Text(
                    'asdasdasdsadasdasdasdsadasdasdasdasdasdasdsdsdadd',
                    style: secondaryTextStyle,
                    maxLines: 2,overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
