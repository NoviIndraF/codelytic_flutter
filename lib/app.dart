import 'package:codelytic/presentation/bloc/auth/auth_bloc.dart';
import 'package:codelytic/presentation/bloc/home/home_bloc.dart';
import 'package:codelytic/presentation/bloc/materi/materi_bloc.dart';
import 'package:codelytic/presentation/bloc/quiz/quiz_bloc.dart';
import 'package:codelytic/presentation/bloc/room/room_bloc.dart';
import 'package:codelytic/presentation/bloc/student/student_bloc.dart';
import 'package:codelytic/presentation/bloc/task/task_bloc.dart';
import 'package:codelytic/presentation/pages/auth/login_class_page.dart';
import 'package:codelytic/presentation/pages/auth/register_class_page.dart';
import 'package:codelytic/presentation/pages/home/main_page.dart';
import 'package:codelytic/presentation/pages/auth/login_page.dart';
import 'package:codelytic/presentation/pages/intro_page.dart';
import 'package:codelytic/presentation/pages/materi/chapter_page.dart';
import 'package:codelytic/presentation/pages/materi/materi_chapter_page.dart';
import 'package:codelytic/presentation/pages/materi/materi_page.dart';
import 'package:codelytic/presentation/pages/auth/register_page.dart';
import 'package:codelytic/presentation/pages/quiz/answer_detail_page.dart';
import 'package:codelytic/presentation/pages/quiz/question_page.dart';
import 'package:codelytic/presentation/pages/quiz/quiz_all_history_page.dart';
import 'package:codelytic/presentation/pages/quiz/quiz_category_page.dart';
import 'package:codelytic/presentation/pages/quiz/quiz_detail_page.dart';
import 'package:codelytic/presentation/pages/quiz/quiz_history_page.dart';
import 'package:codelytic/presentation/pages/quiz/quiz_page.dart';
import 'package:codelytic/presentation/pages/splash_page.dart';
import 'package:codelytic/presentation/pages/task/task_detail_page.dart';
import 'package:codelytic/presentation/pages/task/task_history_page.dart';
import 'package:codelytic/presentation/pages/task/task_page.dart';
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
        BlocProvider(create: (_) => di.locator<MateriBloc>()),
        BlocProvider(create: (_) => di.locator<QuizBloc>()),
        BlocProvider(create: (_) => di.locator<RoomBloc>()),
        BlocProvider(create: (_) => di.locator<TaskBloc>()),
        BlocProvider(create: (_) => di.locator<StudentBloc>()),
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

        onGenerateRoute: (settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case AppRoute.answerDetail:
              builder = (BuildContext context) => AnswerDetailPage();
              break;
            case AppRoute.chapter:
              builder = (BuildContext context) => ChapterPage();
              break;
            case AppRoute.intro:
              builder = (BuildContext context) => IntroPage();
              break;
            case AppRoute.login:
              builder = (BuildContext context) => LoginPage();
              break;
            case AppRoute.loginClass:
              builder = (BuildContext context) => LoginClassPage();
              break;
            case AppRoute.main:
              builder = (BuildContext context) => MainPage();
              break;
            case AppRoute.materi:
              builder = (BuildContext context) => MateriPage();
              break;
            case AppRoute.materiChapter:
              builder = (BuildContext context) => MateriChapterPage();
              break;
            case AppRoute.questionPage:
              builder = (BuildContext context) => QuestionPage();
              break;
            case AppRoute.quiz:
              builder = (BuildContext context) => QuizPage();
              break;
            case AppRoute.quizCategory:
              builder = (BuildContext context) => QuizCategoryPage();
              break;
            case AppRoute.quizDetail:
              builder = (BuildContext context) => QuizDetailPage();
              break;
            case AppRoute.quizAllHistory:
              builder = (BuildContext context) => QuizAllHistoryPage();
              break;
            case AppRoute.quizHistory:
              builder = (BuildContext context) => QuizHistoryPage();
              break;
            case AppRoute.register:
              builder = (BuildContext context) => RegisterPage();
              break;
            case AppRoute.registerClass:
              builder = (BuildContext context) => RegisterClassPage();
              break;
            case AppRoute.splashScreen:
              builder = (BuildContext context) => SplashPage();
              break;
            case AppRoute.task:
              builder = (BuildContext context) => TaskPage();
              break;
            case AppRoute.taskDetail:
              builder = (BuildContext context) => TaskDetailPage();
              break;
            case AppRoute.taskHistory:
              builder = (BuildContext context) => TaskHistoryPage();
              break;
            default:
              builder = (BuildContext context) => Container(child: Center(child: Text("Page Not Fount")));
              break;
          }
          return MaterialPageRoute(
            builder: builder,
            settings: settings,
          );
        },
      ),
    );
  }
}