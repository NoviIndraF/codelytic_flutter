import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/presentation/bloc/auth/auth_bloc.dart';
import 'package:codelytic/presentation/widgets/show_widget.dart';
import 'package:flutter/material.dart';
import 'package:codelytic/common/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is AuthLogout){
          Navigator.popAndPushNamed(context, AppRoute.login);
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Stack(
              children: [
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
                                SizedBox(height: 16,),
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/img-profile.png')),
                                  ),
                                ),
                                SizedBox(height: 16,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Alexandriano',
                                      style: secondaryTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: semibold,
                                      ),
                                    ),
                                    Text(
                                      'alexandriano@gmail.com',
                                      style: secondaryTextStyle.copyWith(
                                      ),
                                    ),
                                  ],
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

  AppBar header(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor2,
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.all(Dimens.defaultMargin),
          child: Row(
            children: [
              // ClipOval(
              //   child: Image.asset(
              //     '',
              //     width: 64,
              //   ),
              // ),
              SizedBox(width: 16,),
              Expanded(child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, Alex',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semibold,
                    ),
                  ),
                  Text(
                    '@alasd',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              )
              ),
              // GestureDetector(
              //   onTap: (){
              //     // Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
              //   },
              //   child: Image.asset(
              //     '',
              //     width: 20,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
  StatelessWidget menuItem(String text) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: blackTextStyle
          ),
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
            SizedBox(height: 30,),
            Text(
                'Account Settings',
                style: subtitleTextStyle.copyWith(
                  color: greyTextColor,
                  fontSize: 14,
                )
            ),
            GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/edit-profile');
                },
                child: menuItem('Edit Profile')
            ),
            menuItem('Your Class'),
            menuItem('Help'),
            SizedBox(height: 30,),
            Text(
                'General',
                style: subtitleTextStyle.copyWith(
                  color: greyTextColor,
                  fontSize: 14,
                )
            ),
            menuItem('Privacy & Policy'),
            menuItem('Terms of Service'),
            menuItem('Rate App'),
            GestureDetector(
                onTap: () async {
                  var confirm = ShowWidget.confirmDialog(
                      context,
                      TextApp.confirmLogOut);
                  if (await confirm) {
                    context.read<AuthBloc>().add(AuthLogoutEvent());
                  }
                },
                child: menuItem(TextApp.logOut)
            ),

            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
