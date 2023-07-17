import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/data/model/argument/route_argument.dart';
import 'package:codelytic/presentation/bloc/auth/auth_bloc.dart';
import 'package:codelytic/presentation/bloc/student/student_bloc.dart';
import 'package:codelytic/presentation/widgets/show_widget.dart';
import 'package:flutter/material.dart';
import 'package:codelytic/common/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'home_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLogout) {
          Constant.setToken("");
          Constant.setCode("");
          Constant.setRoomId(0);
          Navigator.popAndPushNamed(context, AppRoute.login);
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Stack(children: [
            Container(
              height: Dimens.heighMax(context),
              color: primaryColor,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 18.0,
                      left: 18.0,
                      right: 18.0,
                      bottom: 18.0,
                    ),
                    child: Container(
                        height: Dimens.heighMax(context) * 0.3,
                        width: Dimens.widthMax(context),
                        color: primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                child: SvgPicture.asset(
                                  'assets/icons/ic-student.svg',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            BlocBuilder<StudentBloc, StudentState>(
                              buildWhen: (prevState, state) =>  state is StudentGetState,
                              builder: (context, state) {
                                if (state is StudentGetState){
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${state.getStudentEntity.name}',
                                        style: secondaryTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: semibold,
                                        ),
                                      ),
                                      Text(
                                        '@${state.getStudentEntity.username}',
                                        style: secondaryTextStyle.copyWith(
                                        ),
                                      ),
                                    ],
                                  );
                                } else
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '...',
                                        style: secondaryTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: semibold,
                                        ),
                                      ),
                                      Text(
                                        '...',
                                        style: secondaryTextStyle.copyWith(
                                        ),
                                      ),
                                    ],
                                  );
                              },
                            ),
                          ],
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimens.clipRounded),
                        topLeft: Radius.circular(Dimens.clipRounded),
                      ),
                      color: secondaryColor,
                    ),
                    child: content(context),
                  ),
                ],
              ),
            )
          ]);
        },
      ),
    );
  }

  StatelessWidget menuItem(String text) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: blackTextStyle),
          Icon(
            Icons.chevron_right,
            color: primaryColor,
          ),
        ],
      ),
    );
  }

  Expanded content(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text('Account Settings',
                style: subtitleTextStyle.copyWith(
                  color: greyTextColor,
                  fontSize: 14,
                )),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.profileDetail);
                },
                child: menuItem('Profile')),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, AppRoute.intro, arguments: RouteArgument(route: ""));
              },
                child: menuItem('Information')),
            menuItem('Help'),
            SizedBox(
              height: 30,
            ),
            Text('General',
                style: subtitleTextStyle.copyWith(
                  color: greyTextColor,
                  fontSize: 14,
                )),
            menuItem('Privacy & Policy'),
            menuItem('Terms of Service'),
            menuItem('Rate App'),
            GestureDetector(
                onTap: () async {
                  var confirm =
                  ShowWidget.confirmDialog(context, TextApp.confirmLogOut);
                  if (await confirm) {
                    context.read<AuthBloc>().add(AuthLogoutEvent());
                  }
                },
                child: menuItem(TextApp.logOut)),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
