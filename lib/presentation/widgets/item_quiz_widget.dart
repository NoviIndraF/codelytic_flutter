import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/response/quiz/get_quiz_by_level_and_room_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemQuizWidget extends StatelessWidget {
  ItemQuizWidget(
    this.index,
    this.item, {
    Key? key,
  }) : super(key: key);

  int? index;
  Quiz? item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.quizDetail,arguments:item);
      },
      child: Container(
        child: Wrap(
          children: [
            Container(
              height: 230,
              width: 160,
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
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(Dimens.clipRounded)),
                        color: accentColor3,
                      ),
                      child: Container(
                        child: SvgPicture.asset(
                          'assets/icons/ic-quiz.svg',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "${item?.title}",
                    style: subtitleTextStyle.copyWith(fontSize: 14),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(item?.level??0, (index) {
                      return Icon(
                        Icons.star,
                        color: startColor,
                      );
                    }),
                  ),
                  Text(
                    "${item?.description}",
                    style: normalTextStyle.copyWith(fontWeight: medium),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
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
