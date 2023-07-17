import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/argument/route_argument.dart';
import 'package:codelytic/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context, RouteArgument routes) {
    context.read<AuthBloc>().add(AuthSaveFirstEvent("1"));
    if (routes.route == ""){
      Navigator.pop(context);
    } else{
      Navigator.popAndPushNamed(context, routes.route??AppRoute.main);
    }
  }

  Widget _buildImage(String assetName, [double width = 100]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    RouteArgument routes = ModalRoute.of(context)!.settings.arguments as RouteArgument;

    const bodyStyle = TextStyle(fontSize: 19.0, color: Colors.white);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.white),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.blue,
      imagePadding: EdgeInsets.zero,
    );

    return SafeArea(
      child: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.blue,
        allowImplicitScrolling: true,
        // autoScrollDuration: 3000,
        // infiniteAutoScroll: true,
        globalHeader: Align(
          alignment: Alignment.topRight,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                _buildImage('img-splash.png', 32),
                SizedBox(
                  width: 12,
                ),
                Text("Codelityc")
              ]),
            ),
          ),
        ),
        pages: [
          PageViewModel(
            titleWidget: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                "Selamat datang di Aplikasi Codelytic",
                style: headerTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            bodyWidget: Column(
              children: [
                Container(
                    width: Dimens.widthMax(context) - 20,
                    height: 300,
                    child: Lottie.asset("assets/lottie/welcome.json")),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Aplikasi ini memberikan pengalaman pembelajaran interaktif dan fleksibel serta membantu Anda belajar secara efektif dan menyenangkan. Berikut beberapa fitur yang tersedia dalam aplikasi kami:",
                  style: secondaryTextStyle,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            titleWidget: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                "1. Materi Online",
                style: headerTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            bodyWidget: Column(
              children: [
                Container(
                    width: Dimens.widthMax(context) - 20,
                    height: 300,
                    child: Lottie.asset("assets/lottie/read.json")),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Akses materi pelajaran lengkap dan terstruktur dengan mudah. Materi-materi yang disediakan mencakup berbagai bidang studi dan tingkat kesulitan, memungkinkan Anda mempelajarinya sesuai kebutuhan.",
                  style: secondaryTextStyle,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            titleWidget: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                "2. Tugas Online",
                style: headerTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            bodyWidget: Column(
              children: [
                Container(
                    width: Dimens.widthMax(context) - 20,
                    height: 300,
                    child: Lottie.asset("assets/lottie/task.json")),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Dapatkan tugas interaktif dari instruktur atau guru Anda. Unggah jawaban tugas Anda dan dapatkan umpan balik langsung. Tugas ini membantu melatih pemahaman dan penerapan konsep yang dipelajari.",
                  style: secondaryTextStyle,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            titleWidget: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                "3. Kuis Online",
                style: headerTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            bodyWidget: Column(
              children: [
                Container(
                    width: Dimens.widthMax(context) - 20,
                    height: 300,
                    child: Lottie.asset("assets/lottie/quiz.json")),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Uji pemahaman Anda melalui kuis interaktif. Kuis ini menantang pengetahuan Anda dan memberikan evaluasi. Lihat skor dan pemahaman setelah menyelesaikan kuis.",
                  style: secondaryTextStyle,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            titleWidget: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                "4. Diskusi Online",
                style: headerTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            bodyWidget: Column(
              children: [
                Container(
                    width: Dimens.widthMax(context) - 20,
                    height: 300,
                    child: Lottie.asset("assets/lottie/discussion.json")),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Berkomunikasi dengan pengguna lain melalui fitur diskusi online. Bagikan pendapat, tanyakan pertanyaan, dan diskusikan materi dengan komunitas kami. Diskusi online memungkinkan pembelajaran kolaboratif dan perluasan wawasan.",
                  style: secondaryTextStyle,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            titleWidget: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                "Terima Sudah Bergabung di Codelityc",
                style: headerTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            bodyWidget: Column(
              children: [
                Container(
                    width: Dimens.widthMax(context) - 20,
                    height: 300,
                    child: Lottie.asset("assets/lottie/join.json")),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Kami berkomitmen memberikan pengalaman pembelajaran terbaik melalui aplikasi kami. Nikmati perjalanan belajar Anda dengan Aplikasi Codelityc.",
                  style: secondaryTextStyle,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context, routes),
        onSkip: () => _onIntroEnd(context, routes), // You can override onSkip callback
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: false,
        //rtl: true, // Display as right-to-left
        back: const Icon(Icons.arrow_back, color: Colors.white),
        skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Selesai',
            style: TextStyle(fontWeight: FontWeight.w600)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            color: Colors.white),
      ),
    );
  }
}
