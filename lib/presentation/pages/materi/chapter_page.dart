import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/helper.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/request/materi/content_chapter_request.dart';
import 'package:codelytic/data/model/request/materi/show_chapter_request.dart';
import 'package:codelytic/presentation/bloc/materi/materi_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChapterPage extends StatefulWidget {
  ChapterPage({Key? key}) : super(key: key);
  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  WebViewController? _controller;
  int index = 0;
  int counter = 0;
  var bodyer;
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ShowIndexArgument routes = ModalRoute.of(context)!.settings.arguments as ShowIndexArgument;
    context.read<MateriBloc>().add(
        MateriChangesChapterEvent(
            routes.index!, false, false));
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Container(
          height: Dimens.heighMax(context) / 3,
          color: primaryColor,
        ),
        BlocBuilder<MateriBloc, MateriState>(
          buildWhen: (context, state) {
            return state is MateriChangesChapterState;
          },
          builder: (context, state) {
            if (state is MateriChangesChapterState) {
              print("Pulupulu : ${counter++}");

              bodyer = Helper.convertMapToFormUrlEncoded(
                  ContentChapterRequest(content: "${state.chapter.content}")
                      .toMap());

              index = state.currentIndex;
            }
            return Container(
              height: Dimens.heighMax(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 80,
                      width: Dimens.widthMax(context),
                      color: primaryColor,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Icon(
                                Icons.arrow_back,
                                color: secondaryColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: (state is MateriChangesChapterState)
                                    ? Text(
                                        "${state.chapter.index}. ${state.chapter.title}",
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
                        child: (state is MateriChangesChapterState)
                            ? WebViewWidget(
                                controller: _controller!
                                  ..loadRequest(
                                      Uri.parse(
                                          '${Constant.baseUrl}showChapter'),
                                      method: LoadRequestMethod.post,
                                      headers: {
                                        'Content-Type':
                                            'application/x-www-form-urlencoded',
                                      },
                                      body: Uint8List.fromList(
                                          utf8.encode(bodyer))))
                            : SizedBox()),
                  ),
                  Container(
                      height: 80,
                      width: Dimens.widthMax(context),
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimens.defaultMargin),
                      color: primaryColor,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: BlocBuilder<MateriBloc, MateriState>(
                              buildWhen: (prevState, state) {
                                return state is MateriPrevChapterButton;
                              },
                              builder: (context, state) {
                                if (state is MateriPrevChapterButton) {
                                  if (!state.prevButton) {
                                    return SizedBox();
                                  }
                                }
                                return GestureDetector(
                                  onTap: () {
                                    context.read<MateriBloc>().add(
                                        MateriChangesChapterEvent(
                                            index, false, true));
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.keyboard_arrow_left,
                                          color: secondaryColor,
                                        ),
                                        Text(
                                          "Sebelumnya",
                                          style: secondaryTextStyle.copyWith(
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: BlocBuilder<MateriBloc, MateriState>(
                              buildWhen: (prevState, state) {
                                return state is MateriNextChapterButton;
                              },
                              builder: (context, state) {
                                if (state is MateriNextChapterButton) {
                                  if (!state.nextButton) {

                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
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
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Selesai",
                                              style: secondaryTextStyle.copyWith(
                                                  fontSize: 16),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_right,
                                              color: secondaryColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                }
                                return GestureDetector(
                                  onTap: () {
                                    context.read<MateriBloc>().add(
                                        MateriChangesChapterEvent(
                                            index, true, false));
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(Dimens.clipRounded),
                                      ),
                                      color: accentColor3,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Selanjutnya",
                                          style: secondaryTextStyle.copyWith(
                                              fontSize: 16),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          color: secondaryColor,
                                        )
                                      ],
                                    ),
                                  ),
                                );
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
    )));
  }
}
