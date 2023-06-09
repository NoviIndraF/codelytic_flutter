import 'package:codelytic/common/dimens.dart';
import 'package:flutter/material.dart';
import 'package:codelytic/common/theme.dart';

class ItemNewQuizWidget extends StatelessWidget {
  ItemNewQuizWidget(this.title, this.description, this.star, {Key? key}) : super(key: key);
  String? title;
  String? description;
  int? star;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: [
            Container(
              height: 200,
              width: (Dimens.widthMax(context)*0.45),
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
                  height: 4,
                ),
                Text(
                  title??"",
                  style: subtitleTextStyle.copyWith(
                    fontSize: 14
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: startColor,size: 20,),
                    Icon(Icons.star, color: startColor,size: 20,),
                    Icon(Icons.star, color: startColor,size: 20,),
                    Icon(Icons.star, color: startColor,size: 20,),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  description ??"",
                  style: normalTextStyle.copyWith(
                    fontSize: 12
                  ),
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
