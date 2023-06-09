import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/helper.dart';
import 'package:codelytic/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemNewTaskWidget extends StatelessWidget {
  ItemNewTaskWidget(this.title, this.description, this.deadline, {Key? key})
      : super(key: key);
  String? title;
  String? description;
  String? deadline;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        height: 125,
        width: 280,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bgColor3,
        ),
        child: Row(
          children: [
            Container(
              height: 68,
              width: 68,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.clipRounded)),
                color: accentColor,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title ?? "",
                    style: subtitleTextStyle2.copyWith(fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    description ?? "",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text('Deadline : $deadline ',
                      style: accentTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
