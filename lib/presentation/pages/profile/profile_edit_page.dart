import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/data/model/request/profile/update_profile_request.dart';
import 'package:codelytic/presentation/bloc/auth/auth_bloc.dart';
import 'package:codelytic/presentation/bloc/student/student_bloc.dart';
import 'package:codelytic/presentation/widgets/show_widget.dart';
import 'package:flutter/material.dart';
import 'package:codelytic/common/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../home/home_page.dart';

class ProfileEditPage extends StatelessWidget {
  ProfileEditPage({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<StudentBloc, StudentState>(
  listener: (context, state) {
    if (state is StudentUpdateState){
      context.read<StudentBloc>().add(StudentGetEvent(Constant.getToken()));
      Navigator.pop(context);
    }
  },
  child: SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            height: Dimens.heighMax(context),
            color: primaryColor,
          ),
          Column(
            children: [
              Container(
                  width: Dimens.widthMax(context),
                  color: primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: Dimens.widthMax(context),
                          color: primaryColor,
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
                                "Edit Profile",
                                style: secondaryTextStyle.copyWith(fontSize: 20),
                              ),
                              Spacer(),

                            ],
                          )),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: SvgPicture.asset(
                            'assets/icons/ic-student.svg',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  )),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimens.clipRounded),
                      topLeft: Radius.circular(Dimens.clipRounded),
                    ),
                    color: secondaryColor,
                  ),
                  child: Content(context),
                ),
              ),
            ],
          ),
        ]),
      ),
    ),
);
  }

  Expanded Content(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimens.clipRounded),
            topLeft: Radius.circular(Dimens.clipRounded),
          ),
          color: secondaryColor,
        ),
        child: BlocBuilder<StudentBloc, StudentState>(
          buildWhen: (prevState, state) => state is StudentGetState,
          builder: (context, state) {
            if (state is StudentGetState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  EditItem('Nama', state.getStudentEntity.name ?? '...', usernameController),
                  EditItem(
                      'Username', state.getStudentEntity.username ?? '...', nameController),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 1, child: SizedBox()),
                      Expanded(flex: 1, child: GestureDetector(
                        onTap: () {
                          UpdateProfileRequest request = UpdateProfileRequest(name: nameController.text, username: nameController.text);
                          context.read<StudentBloc>().add(
                              StudentUpdateEvent(Constant.getToken(),request));
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(Dimens.clipRounded),
                            ),
                            color: accentColor2,
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Simpan",
                                style: secondaryTextStyle.copyWith(
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                ],
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text('Profile',
                      style: subtitleTextStyle.copyWith(
                        color: greyTextColor,
                        fontSize: 14,
                      )),
                  EditItem('...', '...', nameController),
                  EditItem('...', '...', usernameController),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

StatelessWidget EditItem(String title, String text, TextEditingController textController) {
  textController.text = text;
  return Container(
    margin: EdgeInsets.only(top: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(flex: 1, child: Text(title, style: blackTextStyle)),
        Flexible(flex: 1, child: TextField(controller: textController,)),
      ],
    ),
  );
}
