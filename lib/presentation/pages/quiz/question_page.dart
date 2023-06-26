import 'dart:convert';
import 'dart:typed_data';

import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/form_validator.dart';
import 'package:codelytic/common/helper.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/request/materi/content_chapter_request.dart';
import 'package:codelytic/data/model/request/quiz/submit_quiz_request.dart';
import 'package:codelytic/presentation/bloc/quiz/quiz_bloc.dart';
import 'package:codelytic/presentation/widgets/show_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({Key? key}) : super(key: key);
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  WebViewController? _controller;
  int index = 0;
  int counter = 0;
  var bodyer;
  TextEditingController answerController = TextEditingController();
  final GlobalKey<FormState> _formAnswerSubmit = GlobalKey<FormState>();

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );

    context.read<QuizBloc>().add(QuizChangesQuestionEvent(0, false, false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuizBloc, QuizState>(
      listener: (context, state) {

      },
      child: WillPopScope(
        onWillPop: () async {
          var confirm = ShowWidget.confirmDialog(
              context, "Apakah anda sudah yakin ingin meninggalkan kuis?, semua jawaban akan terhapus");
          if (await confirm) {
            context.read<QuizBloc>().add(QuizResetAnswertEvent());
            Navigator.pop(context);
          }
          return confirm;
        },
        child: SafeArea(
            child: Scaffold(
                body: Stack(
          children: [
            Container(
              height: Dimens.heighMax(context) / 3,
              color: accentColor3,
            ),
            BlocBuilder<QuizBloc, QuizState>(
              buildWhen: (context, state) {
                return state is QuizChangesQuestionState;
              },
              builder: (context, state) {
                if (state is QuizChangesQuestionState) {
                  print("Pulupulu : ${counter++}");

                  bodyer = Helper.convertMapToFormUrlEncoded(
                      ContentChapterRequest(content: "${state.question.content}")
                          .toMap());

                  index = state.currentIndex;
                }
                return Form(
                  key: _formAnswerSubmit,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: Dimens.widthMax(context),
                          color: accentColor3,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  var confirm = ShowWidget.confirmDialog(
                                      context, "Apakah anda sudah yakin ingin meninggalkan kuis?, semua jawaban akan terhapus");
                                  if (await confirm) {
                                    context.read<QuizBloc>().add(QuizResetAnswertEvent());
                                    Navigator.pop(context);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: secondaryColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.only(right: 30.0),
                                    child: (state is QuizChangesQuestionState)
                                        ? Text(
                                            "${state.currentIndex + 1}. ${state.question.title}",
                                            style: secondaryTextStyle.copyWith(
                                                fontSize: 16),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        : Text(
                                            "......",
                                            style: secondaryTextStyle.copyWith(
                                                fontSize: 16),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                              ),
                            ],
                          )),
                      (state is QuizChangesQuestionState)
                          ? (state.question.description != "")
                              ? Container(
                                  width: Dimens.widthMax(context),
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    "Deskripsi : ${state.question.description}",
                                    style:
                                        secondaryTextStyle.copyWith(fontSize: 12),
                                  ))
                              : SizedBox()
                          : SizedBox(),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Dimens.clipRounded),
                                topRight: Radius.circular(Dimens.clipRounded),
                              ),
                              color: bgColor1,
                            ),
                            padding: EdgeInsets.only(top: 24),
                            child: (state is QuizChangesQuestionState)
                                ? WebViewWidget(
                                    controller: _controller!
                                      ..loadRequest(
                                          Uri.parse(
                                              '${Constant.baseUrl}showQuestion'),
                                          method: LoadRequestMethod.post,
                                          headers: {
                                            'Content-Type':
                                                'application/x-www-form-urlencoded',
                                          },
                                          body: Uint8List.fromList(
                                              utf8.encode(bodyer))))
                                : SizedBox()),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      (state is QuizChangesQuestionState)
                          ? (state.question.note != "")
                              ? Container(
                                  width: Dimens.widthMax(context),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 20),
                                  color: accentColor3,
                                  child: Text(
                                    "Note : ${state.question.note}",
                                    style:
                                        secondaryTextStyle.copyWith(fontSize: 12),
                                  ))
                              : SizedBox()
                          : SizedBox(),
                      AnswerInput(),
                      Container(
                          height: 80,
                          width: Dimens.widthMax(context),
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimens.defaultMargin),
                          color: accentColor3,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: BlocBuilder<QuizBloc, QuizState>(
                                  buildWhen: (prevState, state) {
                                    return state is QuizPrevQuestionButton;
                                  },
                                  builder: (context, state) {
                                    if (state is QuizPrevQuestionButton) {
                                      if (!state.prevButton) {
                                        return SizedBox();
                                      } else {
                                        answerController.value =
                                            TextEditingValue(text: state.answer);
                                        return PrevButtonWidget();
                                      }
                                    }
                                    return SizedBox();
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 1,
                                child: BlocBuilder<QuizBloc, QuizState>(
                                  buildWhen: (prevState, state) {
                                    return state is QuizNextQuestionButton;
                                  },
                                  builder: (context, state) {
                                    if (state is QuizNextQuestionButton) {
                                      if (!state.nextButton) {
                                        answerController.text = state.answer;
                                        return DoneButtonWidget();
                                      } else {
                                        answerController.text = state.answer;
                                        return NextButtonWidget();
                                      }
                                    } else {
                                      return SizedBox();
                                    }
                                  },
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                );
              },
            ),
          ],
        ))),
      ),
    );
  }

  StatelessWidget AnswerInput() {
    return Container(
      color: accentColor3,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                Icon(
                  Icons.link_sharp,
                  color: accentColor,
                  size: 20,
                ),
                const SizedBox(width: 16),
                Expanded(
                    child: TextFormField(
                  controller: answerController,
                  validator: FormValidator.taskAnswerValidate,
                  style: thirdTextStyle,
                  decoration: InputDecoration.collapsed(
                    hintText: TextApp.tfHintAnswer,
                    hintStyle: hintTextStyle.copyWith(
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

  StatelessWidget DoneButtonWidget() {
    return Container(
      child: BlocBuilder<QuizBloc, QuizState>(
        buildWhen: (prevState, state) {
          return state is QuizChangesQuestionState;
        },
        builder: (context, state) {
          if (state is QuizChangesQuestionState) {
            return GestureDetector(
              onTap: () async {
                if (Helper.validate(_formAnswerSubmit)) {
                  context.read<QuizBloc>().add(QuizSetAnswertEvent(
                      state.question.id ?? 0,
                      answerController.text,
                      state.currentIndex));
                  var confirm = ShowWidget.confirmDialog(
                      context, "Apakah anda sudah yakin dengan semua jawaban kuis?");
                  if (await confirm) {
                    Navigator.popAndPushNamed(context, AppRoute.answerDetail);
                  }
                }
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dimens.clipRounded),
                  ),
                  color: accentColor2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Selesai",
                      style: secondaryTextStyle.copyWith(fontSize: 16),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: secondaryColor,
                    )
                  ],
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  StatelessWidget NextButtonWidget() {
    return Container(
      child: BlocBuilder<QuizBloc, QuizState>(
        buildWhen: (prevState, state) {
          return state is QuizChangesQuestionState;
        },
        builder: (context, state) {
          if (state is QuizChangesQuestionState) {
            return GestureDetector(
              onTap: () {
                if (Helper.validate(_formAnswerSubmit)) {
                  context.read<QuizBloc>().add(QuizSetAnswertEvent(
                      state.question.id ?? 0,
                      answerController.text,
                      state.currentIndex));

                  answerController.text = "";
                  context
                      .read<QuizBloc>()
                      .add(QuizChangesQuestionEvent(index, true, false));
                }
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dimens.clipRounded),
                  ),
                  color: accentColor2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Selanjutnya",
                      style: secondaryTextStyle.copyWith(fontSize: 16),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: secondaryColor,
                    )
                  ],
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  StatelessWidget PrevButtonWidget() {
    return GestureDetector(
      onTap: () {
        answerController.text = "";
        context
            .read<QuizBloc>()
            .add(QuizChangesQuestionEvent(index, false, true));
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(Dimens.clipRounded),
          ),
          color: accentColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.keyboard_arrow_left,
              color: secondaryColor,
            ),
            Text(
              "Sebelumnya",
              style: secondaryTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
