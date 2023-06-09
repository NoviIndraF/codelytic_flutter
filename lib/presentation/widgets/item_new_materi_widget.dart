import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/helper.dart';
import 'package:codelytic/common/theme.dart';
import 'package:flutter/material.dart';

class ItemNewMateriWidget extends StatelessWidget {
  ItemNewMateriWidget(this.title, this.description, this.createdAt, {Key? key}) : super(key: key);
  String? title;
  String? description;
  String? createdAt;

  @override
  Widget build(BuildContext context) {
    createdAt = Helper.convertDate(createdAt??"");
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        height: 125,
        width: 280,
        padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.clipRounded),
          color: bgColor3,
        ),
        child: Row(
          children: [
            Container(
              height: 68,
              width: 68,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(Dimens.clipRounded)
                ),
                color: primaryColor,
              ),
              child: Icon(
                Icons.book,
                color: secondaryColor,
                size: 20,
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      title??"",
                      style: subtitleTextStyle2.copyWith(
                          fontSize: 14
                      )
                  ),
                  Text(
                    description??"",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                      'Dibuat : $createdAt ',
                      style: accentTextStyle2.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
