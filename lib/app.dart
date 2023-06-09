import 'dart:async';

import 'package:codelytic/presentation/bloc/auth/auth_bloc.dart';
import 'package:codelytic/presentation/bloc/home/home_bloc.dart';
import 'package:codelytic/presentation/pages/auth/login_class_page.dart';
import 'package:codelytic/presentation/pages/auth/register_class_page.dart';
import 'package:codelytic/presentation/pages/home/main_page.dart';
import 'package:codelytic/presentation/pages/auth/login_page.dart';
import 'package:codelytic/presentation/pages/materi_page.dart';
import 'package:codelytic/presentation/pages/auth/register_page.dart';
import 'package:codelytic/presentation/pages/quiz_category_page.dart';
import 'package:codelytic/presentation/pages/quiz_page.dart';
import 'package:codelytic/presentation/pages/splash_page.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/presentation/pages/task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:codelytic/injection.dart' as di;

import 'common/app_route.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<AuthBloc>()),

        BlocProvider(create: (_) => di.locator<HomeBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthHasCodeRoom || state is AuthSaveCodeRoomEvent) {
              Navigator.popAndPushNamed(context, AppRoute.main);
            }
            if (state is AuthHasToken) {
              if (state.result != ""){
                context.read<AuthBloc>().add(AuthCheckCodeRoomEvent());
              } else {
                Navigator.popAndPushNamed(context, AppRoute.loginClass);
              }
            }
            if (state is AuthFailed || state is AuthError) {
              Navigator.popAndPushNamed(context, AppRoute.login);
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthInitial) {
                  context.read<AuthBloc>().add(AuthCheckEvent());
                }
                if (state is AuthLoading) {
                  return SplashPage();
                }
                return Container();
              }),
        ),
        initialRoute: '/',
        onGenerateRoute: (routes) {
          switch (routes.name) {
            case AppRoute.quizCategory:
              return MaterialPageRoute(builder: (_) => QuizCategoryPage());
            case AppRoute.quiz:
              return MaterialPageRoute(builder: (_) => QuizPage());
            case AppRoute.task:
              return MaterialPageRoute(builder: (_) => TaskPage());
            case AppRoute.materi:
              return MaterialPageRoute(builder: (_) => MateriPage());
            case AppRoute.loginClass:
              return MaterialPageRoute(builder: (_) => LoginClassPage());
            case AppRoute.registerClass:
              return MaterialPageRoute(builder: (_) => RegisterClassPage());
            case AppRoute.login:
              return MaterialPageRoute(builder: (_) => LoginPage());
            case AppRoute.register:
              return MaterialPageRoute(builder: (_) => RegisterPage());
            case AppRoute.main:
              return MaterialPageRoute(builder: (_) => MainPage());
            case AppRoute.splashScreen:
              return MaterialPageRoute(builder: (_) => SplashPage());
            default:
              return MaterialPageRoute(builder: (_) =>
                  Container(child: Center(child: Text("Page Not Fount"))));
          }
        },
      ),
    );
  }
}