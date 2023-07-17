import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/helper.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/request/discussion/show_discussion_request.dart';
import 'package:codelytic/data/model/request/materi/get_chapter_by_materi_id_request.dart';
import 'package:codelytic/data/model/response/discussion/get_student_group_by_room_id_response.dart';
import 'package:codelytic/presentation/bloc/materi/materi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ItemNewDiscussionWidget extends StatelessWidget {
  ItemNewDiscussionWidget(this.studentGroup,
      {Key? key})
      : super(key: key);
  StudentGroup? studentGroup;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoute.disscussionDetailPage, arguments: ShowDiscussionArgument(group: studentGroup?.group));
        },
        child: Container(
          height: 100,
          width: 280,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.clipRounded),
            color: bgColor3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimens.clipRounded/2)),
                  color: accentColor2
                ),
                child: Container(
                  child: SvgPicture.asset(
                    'assets/icons/ic-discuss.svg',
                    width: 20,
                      height: 20,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${studentGroup?.group?.discussion?.title}",
                      style: subtitleTextStyle2.copyWith(fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Kelompok : ${studentGroup?.group?.name}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Dibuat : ${Helper.convertDate(studentGroup?.createdAt ?? "")} ',
                      style: accentTextStyle2.copyWith(
                          fontSize: 12, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
