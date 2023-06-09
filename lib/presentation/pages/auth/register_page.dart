
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/form_validator.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/data/model/request/authentication/register_request.dart';
import 'package:codelytic/presentation/bloc/auth/auth_bloc.dart';
import 'package:codelytic/presentation/widgets/show_widget.dart';
import 'package:flutter/material.dart';
import 'package:codelytic/common/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formRegister = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return BlocListener<AuthBloc, AuthState>(
    listener: (context, state) {
      if (state is AuthRegistered){
        Navigator.pop(context);
      }
      if (state is AuthRegisterFailed) {
        ShowWidget.dialog(context, state.message);
      }
    },
    child: BlocBuilder<AuthBloc, AuthState>(
    builder: (context, state) {
      return Scaffold(
          backgroundColor: bgColor1,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimens.defaultMargin,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: bottom,
                    ),
                    child: Form(
                      key:_formRegister,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          header(),
                          nameInput(),
                          usernameInput(),
                          SizedBox(height: 20,),
                          SizedBox(height: 2,child: Container(
                            color: Colors.grey,
                          ),),
                          SizedBox(height: 4,),
                          emailInput(),
                          passwordInput(),
                          passwordConfirmInput(),
                          (state is AuthLoading )
                          ? Container(
                              height: 80,
                              width: double.infinity,
                              child:
                              Center(
                                  child: CircularProgressIndicator()))
                          : registerButton(context),
                          const SizedBox(height: 40,),
                          footer(context),
                        ],
                      ),
                    ),
                  )
              ),
            ),
          ),
        );
      },
    ),
    );
  }

  StatelessWidget header() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextApp.titleRegister,
            style: subtitleTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semibold,
            ),
          ),
          const SizedBox(height: 2,),
          Text(
            TextApp.headerRegister,
            style: thirdTextStyle,
          ),
        ],
      ),
    );
  }
  StatelessWidget nameInput() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextApp.tfFullName,
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
                    Icon(Icons.person, color: primaryColor, size: 20,),
                    const SizedBox(width: 16),
                    Expanded(
                        child: TextFormField(
                          controller: nameController,
                          style: thirdTextStyle,
                          validator: FormValidator.fullnameValidate,
                          decoration: InputDecoration.collapsed(
                            hintText: TextApp.tfHintFullName,
                            hintStyle: hintTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            )
          ]
      ),
    );
  }
  StatelessWidget usernameInput() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextApp.tfUsername,
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
                    Icon(Icons.person_2_outlined, color: primaryColor, size: 20,),
                    const SizedBox(width: 16),
                    Expanded(
                        child:
                        TextFormField(
                          controller: usernameController,
                          style: thirdTextStyle,
                          validator: FormValidator.usernameValidate,
                          decoration: InputDecoration.collapsed(
                            hintText: TextApp.tfHintUsername,
                            hintStyle: hintTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            )
          ]
      ),
    );
  }
  StatelessWidget emailInput() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextApp.tfEmail,
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
                    Icon(Icons.email, color: primaryColor, size: 20,),
                    const SizedBox(width: 16),
                    Expanded(child: TextFormField(
                      controller: emailController,
                      style: thirdTextStyle,
                      keyboardType: TextInputType.emailAddress,
                      validator: FormValidator.emailValidate,
                      decoration: InputDecoration.collapsed(
                        hintText: TextApp.tfHintEmail,
                        hintStyle: hintTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            )
          ]
      ),
    );
  }
  StatelessWidget passwordInput() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextApp.tfPassword,
              style: subtitleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: bgColor3,
                  borderRadius: BorderRadius.circular(Dimens.clipRounded),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.lock, color: primaryColor, size: 20,),
                    const SizedBox(width: 16),
                    Expanded(
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          style: thirdTextStyle,
                          validator: FormValidator.passwordValidate,
                          decoration: InputDecoration.collapsed(
                            hintText: TextApp.tfHintPassword,
                            hintStyle: hintTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            )
          ]
      ),
    );
  }

  StatelessWidget passwordConfirmInput() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextApp.tfConfirmPassword,
              style: subtitleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: bgColor3,
                  borderRadius: BorderRadius.circular(Dimens.defaultMargin),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.lock, color: primaryColor, size: 20,),
                    const SizedBox(width: 16),
                    Expanded(
                        child: TextFormField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          style: thirdTextStyle,
                          validator:
                          (val){
                            return FormValidator.confirmPasswordValidate(val, passwordController.text);
                          },
                          decoration: InputDecoration.collapsed(
                            hintText: TextApp.tfHintConfirmPassword,
                            hintStyle: hintTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            )
          ]
      ),
    );
  }
  StatelessWidget registerButton(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      child: TextButton(
          onPressed: () {
            if(_validate(_formRegister)){

              RegisterRequest request =
              RegisterRequest(
                  name: nameController.text,
                  username: usernameController.text,
                  email: emailController.text,
                  password: passwordController.text
              );
              print("pulu $request");
              context.read<AuthBloc>().add(AuthRegisterEvent(request));
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Text(
            TextApp.btnRegister,
            style: secondaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          )
      ),
    );
  }
  StatelessWidget footer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${TextApp.footerRegister} ',
            style: thirdTextStyle.copyWith(
                fontSize: 12
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              TextApp.btnLogin,
              style: linkTextStyle.copyWith(
                  fontSize: 12
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _validate(GlobalKey<FormState> _formRegister) {
    if (_formRegister.currentState!.validate()){
      return true;
    }
    return false;
  }
}
