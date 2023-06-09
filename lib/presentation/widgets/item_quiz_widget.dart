import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/theme.dart';
import 'package:flutter/material.dart';

class ItemQuizWidget extends StatelessWidget {
  ItemQuizWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        child: Wrap(
          children: [
            Container(
              height: 230,
              width: 172,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.clipRounded),
                color: bgColor3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(Dimens.clipRounded)),
                      color: accentColor3,
                    ),
                    child: Icon(
                      Icons.star,
                      color: secondaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Looing dengan While',
                    style: subtitleTextStyle.copyWith(
                        fontSize: 14
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: startColor,),
                      Icon(Icons.star, color: startColor,),
                      Icon(Icons.star, color: startColor,),
                      Icon(Icons.star, color: startColor,),
                    ],
                  ),
                  Text(
                    'Lorem Ipsum alskdjlasdsa dlsadj sakld salkdjsal dlksa jdlsajdklsa jlkdsaj as dsad sadas sa dsadsadsadasdasdasd  ',
                    style: normalTextStyle.copyWith(fontWeight: medium),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  )
                ],
              ),
            )],
        ),
      ),
    );
  }
}
