import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/argument/route_argument.dart';
import 'package:codelytic/data/model/request/authentication/get_room_by_code_request.dart';
import 'package:codelytic/data/model/response/authentication/get_student_room_response.dart';
import 'package:codelytic/presentation/bloc/auth/auth_bloc.dart';
import 'package:codelytic/presentation/bloc/home/home_bloc.dart';
import 'package:codelytic/presentation/widgets/item_class_widget.dart';
import 'package:codelytic/presentation/widgets/show_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginClassPage extends StatelessWidget {
  LoginClassPage({Key? key}) : super(key: key);

  final TextEditingController codeClassController = TextEditingController();
  String token = '';

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSavedCodeRoomState) {
          context.read<AuthBloc>().add(AuthCheckFirstEvent());
        }
        if(state is AuthHasFirstState){
          if(state.result == "1"){
            Navigator.popAndPushNamed(context, AppRoute.main);
          } else{
            Navigator.popAndPushNamed(context, AppRoute.intro, arguments: RouteArgument(route: AppRoute.main));
          }
        }
        if (state is AuthHasToken) {
          token = state.result;
          context.read<AuthBloc>().add(AuthGetRoomEvent(state.result));
        }
        if (state is AuthFailed) {
          ShowWidget.dialog(context, state.message);
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (prevState, state){
          return state is AuthGetRoom;
        },
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            body: Container(
              padding: EdgeInsets.only(
                top: Dimens.defaultMargin,
                bottom: Dimens.heighBottomKeyboard(context),
                right: Dimens.defaultMargin,
                left: Dimens.defaultMargin,
              ),
              color: bgColor2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Silahkan pilih kelas Anda terlebih dulu...",
                      style: subtitleTextStyle.copyWith(
                        fontSize: 20,
                        color: secondaryColor,
                      ),
                      textAlign: TextAlign.center,
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
                      child: (state is AuthLoading)
                          ? Center(child: CircularProgressIndicator())
                          : (state is AuthGetRoom)
                              ? Column(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Container(
                                          height: 8,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  Dimens.clipRounded),
                                            ),
                                            color: primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        height: Dimens.heighMax(context) / 3,
                                        child: ListView.builder(
                                            itemCount: state.result.data.length,
                                            itemBuilder: (context, index) {
                                              return ItemClassWidget(context,
                                                  state.result.data[index]);
                                            })),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Silahkan input kode kelas anda..."),
                                  ],
                                ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Sudah punya code kelas lain?",
                      style: subtitleTextStyle.copyWith(
                        fontSize: 14,
                        color: secondaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    btnRegisterClassButton(context)
                  ],
                ),
              ),
            ),
          ));
        },
      ),
    );
  }


  StatelessWidget btnRegisterClassButton(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 4),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.registerClass);
          },
          style: TextButton.styleFrom(
            backgroundColor: accentColor2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Text(
            "Masukkan Code",
            style: secondaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          )),
    );
  }
}
