import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/form_validator.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/data/model/request/authentication/login_request.dart';
import 'package:codelytic/presentation/bloc/auth/auth_bloc.dart';
import 'package:codelytic/presentation/widgets/show_widget.dart';
import 'package:flutter/material.dart';
import 'package:codelytic/common/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthGetRoom) {
          if (state.result.data.isEmpty) {
            Navigator.popAndPushNamed(context, AppRoute.registerClass);
          } else {
            Navigator.popAndPushNamed(context, AppRoute.loginClass,
                arguments: {"data": state.result.data});
          }
        }
        if (state is AuthHasToken) {
          context.read<AuthBloc>().add(AuthGetRoomEvent(state.result));
        }
        if (state is AuthRegistered) {
          ShowWidget.showSnackBar(context,
              "Registrasi Berhasil, Silahkan login terlebih dahulu", "success");
        }
        if (state is AuthFailed) {
          ShowWidget.dialog(context, state.message);
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        if (state is AuthError) {
          SnackBar(
              content: Text('Error : ${state.message}'),
              action: SnackBarAction(
                label: 'Tutup',
                onPressed: () {},
              ));
        }
        return Scaffold(
            backgroundColor: bgColor1,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: Dimens.heighBottomKeyboard(context),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: Dimens.heighMax(context),
                      color: primaryColor,
                    ),
                    Column(
                      children: [
                        Container(
                            height: Dimens.heighMax(context) * 0.35,
                            width: Dimens.widthMax(context),
                            color: primaryColor,
                            child: Stack(
                              children: [
                                Positioned(
                                  top:0,
                                  left: 40,
                                  bottom: 0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 40,
                                      ),
                                      header(),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    child: SvgPicture.asset(
                                      'assets/images/arranging-files.svg',
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          height: Dimens.heighMax(context) * 0.65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimens.clipRounded),
                              topLeft: Radius.circular(Dimens.clipRounded),
                            ),
                            color: secondaryColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 24,
                                bottom: Dimens.heighBottomKeyboard(context),
                                right: 24,
                                left: 24),
                            child: Form(
                              key: _formLogin,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  emailInput(),
                                  passwordInput(),
                                  (state is AuthLoading)
                                      ? Container(
                                          height: 80,
                                          width: double.infinity,
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()))
                                      : loginButton(context, _formLogin),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  footer(context),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
      }),
    );
  }

  StatelessWidget header() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextApp.AppName,
            style: secondaryTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semibold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            TextApp.headerLogin,
            style: secondaryTextStyle,
          ),
        ],
      ),
    );
  }

  StatelessWidget emailInput() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Text(
            TextApp.login,
            style: subtitleTextStyle.copyWith(
              fontSize: 20,
              fontWeight: medium,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: bgColor3,
            borderRadius: BorderRadius.circular(Dimens.clipRounded),
          ),
          child: Center(
            child: Row(
              children: [
                Icon(
                  Icons.email,
                  color: primaryColor,
                  size: 20,
                ),
                const SizedBox(width: 16),
                Expanded(
                    child: TextFormField(
                  validator: FormValidator.emailValidate,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: thirdTextStyle,
                  decoration: InputDecoration.collapsed(
                    hintText: TextApp.tfHintEmail,
                    hintStyle: hintTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                )),
              ],
            ),
          ),
        )
      ]),
    );
  }

  StatelessWidget passwordInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: bgColor3,
          ),
          child: Center(
            child: Row(
              children: [
                Icon(
                  Icons.lock,
                  color: primaryColor,
                  size: 20,
                ),
                const SizedBox(width: 16),
                Expanded(
                    child: TextFormField(
                  obscureText: true,
                  style: thirdTextStyle,
                  controller: passwordController,
                  validator: FormValidator.passwordValidate,
                  decoration: InputDecoration.collapsed(
                    hintText: TextApp.tfHintPassword,
                    hintStyle: hintTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                )),
              ],
            ),
          ),
        )
      ]),
    );
  }

  StatelessWidget loginButton(
    BuildContext context,
    GlobalKey<FormState> formGlobalKey,
  ) {
    return Container(
      height: 50,
      width: Dimens.widthMax(context),
      margin: const EdgeInsets.only(top: 30),
      child: TextButton(
          onPressed: () {
            if (_validate(_formLogin)) {
              final request = LoginRequest(
                  email: emailController.text,
                  password: passwordController.text);
              context.read<AuthBloc>().add(AuthLoginEvent(request));
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.clipRounded),
            ),
          ),
          child: Text(
            TextApp.btnLogin,
            style: secondaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          )),
    );
  }

  StatelessWidget footer(BuildContext context) {
    return Container(
      height: 50,
      width: Dimens.widthMax(context),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.register);
        },
        style: TextButton.styleFrom(
          backgroundColor: accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.clipRounded),
          ),
        ),
        child: Text(
          TextApp.btnRegister,
          style: secondaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }

  bool _validate(GlobalKey<FormState> formLogin) {
    if (_formLogin.currentState!.validate()) {
      return true;
    }
    return false;
  }
}
