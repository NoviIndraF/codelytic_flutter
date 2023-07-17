import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/helper.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/request/authentication/get_room_by_code_request.dart';
import 'package:codelytic/data/model/request/authentication/register_room_request.dart';
import 'package:codelytic/data/model/request/discussion/get_group_by_code_request.dart';
import 'package:codelytic/data/model/request/discussion/register_student_group_request.dart';
import 'package:codelytic/data/model/request/discussion/show_discussion_request.dart';
import 'package:codelytic/data/model/response/discussion/get_group_by_code_response.dart';
import 'package:codelytic/data/model/response/discussion/group.dart';
import 'package:codelytic/domain/entities/authentication/get_room_by_code_response_entity.dart';
import 'package:codelytic/presentation/bloc/auth/auth_bloc.dart';
import 'package:codelytic/presentation/bloc/discussion/discussion_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupAddPage extends StatelessWidget {
  GroupAddPage({Key? key}) : super(key: key);
  final TextEditingController codeGroupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<DiscussionBloc, DiscussionState>(
      listener: (context, state) {
        if (state is AuthRegisteredRoom) {}
      },
      child: BlocBuilder<DiscussionBloc, DiscussionState>(
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            body: Container(
              padding: EdgeInsets.only(
                top: Dimens.defaultMargin,
                right: Dimens.defaultMargin,
                left: Dimens.defaultMargin,
              ),
              color: accentColor2,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum memiliki Kelompok?",
                        style: subtitleTextStyle.copyWith(
                          fontSize: 20,
                          color: secondaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: Dimens.widthMax(context),
                        padding: EdgeInsets.all(Dimens.defaultMargin),
                        decoration: BoxDecoration(
                            color: bgColor1,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dimens.clipRounded))),
                        child: GroupEmpty(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
        },
      ),
    );
  }

  StatelessWidget CodeGroupInput() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          TextApp.tfCodeGroup,
          style: subtitleTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: bgColor3,
            borderRadius: BorderRadius.circular(Dimens.clipRounded),
          ),
          child: Center(
            child: Row(
              children: [
                Icon(
                  Icons.class_outlined,
                  color: primaryColor,
                ),
                const SizedBox(width: 16),
                Expanded(
                    child: TextFormField(
                  controller: codeGroupController,
                  style: thirdTextStyle,
                  decoration: InputDecoration.collapsed(
                    hintText: TextApp.tfHintGroupClass,
                    hintStyle: hintTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  BlocBuilder<DiscussionBloc, DiscussionState> GroupEmpty(
      BuildContext context) {
    return BlocBuilder<DiscussionBloc, DiscussionState>(
      builder: (context, state) {
        return Container(
          child: Column(
            children: [
              Text(
                "Masukkan Code Kelompok Anda",
                style: subtitleTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              CodeGroupInput(),
              SizedBox(
                height: 10,
              ),
              (state is DiscussionGetGroupByCodeState)
                  ? (state.entity.group == null)
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("Data Kelompok tidak tersedia"),
                        )
                      : ItemGroupWidget(context, state.entity.group!)
                  : SizedBox(),
              (state is DiscussionLoading)
                  ? CircularProgressIndicator()
                  : SizedBox(),
              BtnChekCodeGroupButton(context),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Code Kelompok ini didapat dari guru/admin anda yang telah membuat kelompok sebelumnya. Jika anda belum mempunyai kode kelompok, silahkan hubungi guru/admin."),
            ],
          ),
        );
      },
    );
  }

  StatelessWidget BtnChekCodeGroupButton(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      child: TextButton(
          onPressed: () {
            GetGroupByCodeRequest request =
                GetGroupByCodeRequest(code: codeGroupController.text);

            context.read<DiscussionBloc>().add(
                DiscussionGetGroupByCodeEvent(Constant.getToken(), request));
          },
          style: TextButton.styleFrom(
            backgroundColor: accentColor2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Text(
            TextApp.btnCheckReedemCodeGroup,
            style: secondaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          )),
    );
  }

  StatelessWidget ItemGroupWidget(BuildContext context, Group? group) {
    return GestureDetector(
      onTap: () {
        RegisterStudentGroupRequest request =
        RegisterStudentGroupRequest(
          group_id: group?.id??0,
          room_id: Constant.getRoomId()??0,
        );

        context.read<DiscussionBloc>().add(DiscussionRegisterStudentGroupByCodeEvent(Constant.getToken(), request));
        Navigator.popAndPushNamed(context, AppRoute.disscussionDetailPage, arguments: ShowDiscussionArgument(group: group));
      },
      child:
            Container(
              padding: EdgeInsets.all(Dimens.defaultMargin),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.clipRounded)),
                color: bgColor3,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(Dimens.defaultMargin),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(Dimens.clipRounded)),
                      color: accentColor2,
                    ),
                    child: Icon(
                      Icons.class_,
                      color: secondaryColor,
                      size: 20,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(left:Dimens.defaultMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            group?.discussion?.title ?? "",
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Kelompok: ${group?.name}",
                            style: blackTextStyle.copyWith(
                                fontSize: 14, color: primaryColor),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ), 
                          Text(
                            "${Helper.convertDate(group?.createdAt)}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

    );
  }
}
