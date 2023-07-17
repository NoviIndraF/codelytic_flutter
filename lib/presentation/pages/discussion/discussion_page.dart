import 'package:codelytic/app.dart';
import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/request/discussion/get_student_group_by_room_id_request.dart';
import 'package:codelytic/data/model/request/materi/get_materi_by_room_id_request.dart';
import 'package:codelytic/data/model/response/discussion/get_student_group_by_room_id_response.dart';
import 'package:codelytic/presentation/bloc/discussion/discussion_bloc.dart';
import 'package:codelytic/presentation/bloc/materi/materi_bloc.dart';
import 'package:codelytic/presentation/pages/home/home_page.dart';
import 'package:codelytic/presentation/widgets/item_discussion_widget.dart';
import 'package:codelytic/presentation/widgets/item_materi_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscussionPage extends StatelessWidget {
  DiscussionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStudentGroupByRoomIdRequest request =
        GetStudentGroupByRoomIdRequest(room_id: Constant.getRoomId());

    context.read<DiscussionBloc>().add(
        DiscussionGetStudentGroupByRoomIdEvent(Constant.getToken(), request));

    return SafeArea(
      child: Scaffold(
        floatingActionButton: AddDiscussion(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Stack(children: [
          Column(
            children: [
              Container(
                height: Dimens.heighMax(context) * 0.3,
                color: accentColor2,
              ),
              Expanded(
                child: Container(
                  color: bgColor1,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: 80,
                    width: Dimens.widthMax(context),
                    color: accentColor2,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.arrow_back,
                              color: secondaryColor,
                            ),
                          ),
                        ),
                        Text(
                          "Diskusi",
                          style: secondaryTextStyle.copyWith(fontSize: 20),
                        ),
                      ],
                    )),
                Container(
                    width: Dimens.widthMax(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimens.clipRounded),
                        topLeft: Radius.circular(Dimens.clipRounded),
                      ),
                      color: bgColor1,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 24, right: 24, left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: 8,
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(Dimens.clipRounded),
                                ),
                                color: accentColor2,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          Text(
                            "List Diskusi",
                            style: subtitleTextStyle,
                          ),
                          Content(context),
                          SizedBox(
                            height: 28,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}

StatelessWidget Content(BuildContext context) {
  return Container(
    child: BlocBuilder<DiscussionBloc, DiscussionState>(
      buildWhen: (previousState, state) {
        return state is DiscussionGetStudentGroupByRoomIdState;
      },
      builder: (context, state) {
        if (state is DiscussionGetStudentGroupByRoomIdState) {
          List<StudentGroup> studenGroup = state.entity.studentGroup ?? [];

          if (studenGroup.isEmpty) {
            return Container(
                height: 140,
                margin: EdgeInsets.only(
                  left: Dimens.defaultMargin,
                ),
                child: Center(
                  child: Text(TextApp.nothingDiscussion),
                ));
          } else {
            return Column(
              children: studenGroup
                  .map((item) => ItemDiscussionWidget(
                        item,
                      ))
                  .toList(),
            );
          }
        } else if (state is DiscussionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
              height: 140,
              margin: EdgeInsets.only(
                top: 12,
                left: Dimens.defaultMargin,
              ),
              child: Center(
                child: Text(TextApp.somethingWrong),
              ));
        }
      },
    ),
  );
}

FloatingActionButton AddDiscussion(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.pushNamed(context, AppRoute.groupAdd);
    },
    backgroundColor: secondaryColor,
    child: Icon(
      Icons.group_add,
      color: accentColor2,
    ),
  );
}


