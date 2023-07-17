import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/presentation/bloc/auth/auth_bloc.dart';
import 'package:codelytic/presentation/bloc/student/student_bloc.dart';
import 'package:codelytic/presentation/widgets/show_widget.dart';
import 'package:flutter/material.dart';
import 'package:codelytic/common/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../home/home_page.dart';

class ProfileDetailPage extends StatelessWidget {
  const ProfileDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                                "Profile",
                                style: secondaryTextStyle.copyWith(fontSize: 20),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, AppRoute.profileEdit);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    Dimens.defaultMargin,
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    color: secondaryColor,
                                  ),
                                ),
                              )
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
                  ContentItem('Nama', state.getStudentEntity.name ?? '...'),
                  ContentItem(
                      'Username', state.getStudentEntity.username ?? '...'),
                  ContentItem('Email', state.getStudentEntity.email ?? '...'),
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
                  ContentItem('...', '...'),
                  ContentItem('...', '...'),
                  ContentItem('...', '...'),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

StatelessWidget ContentItem(String title, String text) {
  return Container(
    margin: EdgeInsets.only(top: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(flex: 1, child: Text(title, style: blackTextStyle)),
        Flexible(flex: 1, child: Text(text, style: blackTextStyle)),
      ],
    ),
  );
}
