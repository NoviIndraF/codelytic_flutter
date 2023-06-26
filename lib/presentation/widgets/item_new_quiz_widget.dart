import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/data/model/response/quiz/get_quiz_by_level_and_room_id.dart';
import 'package:flutter/material.dart';
import 'package:codelytic/common/theme.dart';
import 'package:flutter_svg/svg.dart';

class ItemNewQuizWidget extends StatelessWidget {
  ItemNewQuizWidget(this.item, {Key? key})
      : super(key: key);
  Quiz? item;
  @override
  Widget build(BuildContext context) {
    List<Widget> startWidget = List.generate(
      item?.level ?? 0,
      (index) => Icon(
        Icons.star,
        color: startColor,
        size: 20,
      ),
    );
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.quizDetail,arguments:item);
      },
      child: Container(
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: [
            Container(
              height: 200,
              width: (Dimens.widthMax(context) * 0.45),
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
                      child: SvgPicture.asset(
                        'assets/icons/ic-quiz.svg',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    item?.title ?? "",
                    style: subtitleTextStyle.copyWith(fontSize: 14),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: startWidget,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    item?.description ?? "",
                    style: normalTextStyle.copyWith(fontSize: 12),
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
