import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/presentation/bloc/home/home_bloc.dart';
import 'package:codelytic/presentation/pages/home/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  void initState() {
    context.read<HomeBloc>().add(HomeGetTokenAndCodeEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: bgColor1,
          bottomNavigationBar: customButtonNav(),
          body: pulu()),
    );
  }

  StatelessWidget pulu() {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return ProfilePage();
        break;
      default:
        return HomePage();
    }
  }

  Padding customButtonNav() {
    return Padding(
      padding: const EdgeInsets.only(
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Dimens.clipRounded),
          topRight: Radius.circular(Dimens.clipRounded),
        ),
        child: BottomAppBar(
          height: 84,
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (value) {
                print(value);
                setState(() {
                  currentIndex = value;
                });
              },
              backgroundColor: primaryColor,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Icon(
                        Icons.home_sharp,
                        color: currentIndex == 0
                            ? secondaryColor
                            : primaryDark,
                      ),
                    ),
                    label: ''),
                // BottomNavigationBarItem(
                //   icon: Container(
                //     margin: EdgeInsets.only(top: 20, bottom: 10),
                //     child: Icon(
                //       Icons.chat_bubble,
                //       color:
                //       currentIndex == 1
                //           ? secondaryColor
                //           : primaryDark,
                //     ),
                //   ),
                //   label: '',
                // ),
                // BottomNavigationBarItem(
                //   icon: Container(
                //     margin: EdgeInsets.only(top: 20, bottom: 10),
                //     child: Icon(
                //       Icons.favorite,
                //       color:
                //       currentIndex == 2
                //           ? secondaryColor
                //           : primaryDark,
                //     ),
                //   ),
                //   label: '',
                // ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Icon(
                      Icons.person,
                      color:
                      currentIndex == 3
                          ? secondaryColor
                          : primaryDark,
                    ),
                  ),
                  label: '',
                ),
              ]),
        ),
      ),
    );
  }
}
