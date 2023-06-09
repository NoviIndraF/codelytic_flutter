import 'dart:async';

import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/presentation/bloc/auth/auth_bloc.dart';
import 'package:codelytic/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // Timer(
    //   const Duration(seconds: 3),
    //       () => Navigator.pushNamed(context, AppRoute.login),
    // );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial || state is AuthLoading){
          context.read<AuthBloc>().add(AuthCheckEvent());
          return Scaffold(
            backgroundColor: bgColor1,
            body: Center(
              child: Container(
                width: 130,
                height: 150,
                child: Text("Codelytic"),
              ),
            ),
          );
        }
        if (state is AuthHasToken){
          Navigator.pushNamed(context, AppRoute.main);
        }
        if (state is AuthFailed || state is AuthError){
          Navigator.pushNamed(context, AppRoute.login);
        }
        return Container();
      },
    );
  }
}
