import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/theme.dart';
import 'package:flutter/material.dart';

class ItemTaskWidget extends StatelessWidget {
  const ItemTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 8),
      child: Container(
        height: 128,
        padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bgColor3,
        ),
        child: Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'Looping',
                        style: subtitleTextStyle2.copyWith(
                            fontSize: 16
                        )
                    ),
                    Text(
                      'Penjelasan terkait baasdasdasdasdasdsadsaasdsdsadasd asd sad asdas dasdasd aasdasdasd',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                        'Deadline : 01/01/2001 ',
                        style: accentTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(Dimens.clipRounded)
                ),
                color: accentColor,
              ),
              child: Icon(
                Icons.book,
                color: secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
