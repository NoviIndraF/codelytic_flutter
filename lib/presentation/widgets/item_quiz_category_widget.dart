import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/request/quiz/get_quiz_by_level_and_room_id_request.dart';
import 'package:codelytic/presentation/bloc/quiz/quiz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ItemQuizCategoryWidget extends StatelessWidget {
  final String level;
  late final int leveling;
  final description;
  ItemQuizCategoryWidget(
    this.level,
    this.leveling,
    this.description, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: (){
          GetQuizByLevelAndRoomIdRequest request = GetQuizByLevelAndRoomIdRequest(room_id: Constant.getRoomId().toString(), level: leveling.toString());
          context.read<QuizBloc>().add(QuizGetQuizByLevelAndRoomIdEvent(Constant.getToken(), request));
          Navigator.pushNamed(context, AppRoute.quiz, arguments: SubTitleQuiz(title: level));
        },
        child: Container(
          height: 120,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: bgColor3,
          ),
          child: Row(
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
              SizedBox(width: 10),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(level,
                          style: subtitleTextStyle2.copyWith(fontSize: 16)),
                      Row(
                        children: [
                          for (int i = 0; i < leveling; i++)
                            Icon(
                              Icons.star,
                              color: accentColor3,
                            ),
                        ],
                      ),
                      Text(
                        description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubTitleQuiz {
  String? title;

  SubTitleQuiz({ this.title,});

  Map<String, dynamic> toMap() {
    return {'title': title,};
  }
}
