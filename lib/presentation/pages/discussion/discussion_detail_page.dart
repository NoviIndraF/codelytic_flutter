import 'dart:convert';
import 'dart:typed_data';

import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/form_validator.dart';
import 'package:codelytic/common/helper.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/request/discussion/get_student_group_comment_by_group_id_request.dart';
import 'package:codelytic/data/model/request/discussion/send_student_group_coment_request.dart';
import 'package:codelytic/data/model/request/discussion/show_discussion_request.dart';
import 'package:codelytic/data/model/request/discussion/update_hide_student_group_comment_request.dart';
import 'package:codelytic/data/model/request/materi/content_chapter_request.dart';
import 'package:codelytic/data/model/request/materi/show_chapter_request.dart';
import 'package:codelytic/data/model/request/task/get_student_task_by_room_id_request.dart';
import 'package:codelytic/data/model/request/task/show_task_request.dart';
import 'package:codelytic/data/model/request/task/submit_task_request.dart';
import 'package:codelytic/data/model/response/discussion/get_student_group_by_room_id_response.dart';
import 'package:codelytic/data/model/response/discussion/get_student_group_comment_by_group_id_response.dart';
import 'package:codelytic/presentation/bloc/discussion/discussion_bloc.dart';
import 'package:codelytic/presentation/bloc/materi/materi_bloc.dart';
import 'package:codelytic/presentation/bloc/task/task_bloc.dart';
import 'package:codelytic/presentation/widgets/show_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DiscussionDetailPage extends StatefulWidget {
  DiscussionDetailPage({Key? key}) : super(key: key);
  @override
  State<DiscussionDetailPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<DiscussionDetailPage> {
  WebViewController? _controller;
  int index = 0;
  int view = Constant.CHATGROUP;
  OverlayEntry? _overlayEntry;
  var bodyer;
  TextEditingController commentController = TextEditingController();
  final GlobalKey<FormState> _formCommentSubmit = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<DiscussionBloc>().add(DiscussionChangesViewEvent(view));
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
    ShowDiscussionArgument routes =
        ModalRoute.of(context)!.settings.arguments as ShowDiscussionArgument;

    bodyer = Helper.convertMapToFormUrlEncoded(
        ContentChapterRequest(content: "${routes.group?.discussion?.content}")
            .toMap());
    return BlocListener<DiscussionBloc, DiscussionState>(
      listener: (context, state) {
        if (state is DiscussionSendStudentGroupCommentState ||
            state is DiscussionUpdateHideStudentDiscussionCommentState) {
          GetStudentGroupCommentByGroupIdRequest request =
              GetStudentGroupCommentByGroupIdRequest(
                  group_id: routes.group?.id ?? 0);
          context.read<DiscussionBloc>().add(
              DiscussionGetStudentGroupCommentByGroupIdEvent(
                  Constant.getToken(), request));
        }
      },
      child: SafeArea(
          child: Scaffold(
              // floatingActionButton: ChatGroup(context, view, routes),
              // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
              body: Stack(
                children: [
                  Container(
                    height: Dimens.heighMax(context) / 3,
                    color: accentColor2,
                  ),
                  BlocBuilder<DiscussionBloc, DiscussionState>(
                    buildWhen: (prevState, state) =>
                        state is DiscussionChangesViewState,
                    builder: (context, state) {
                      if (state is DiscussionChangesViewState) {
                        if (state.view == Constant.DISCUSSION) {
                          return DiscussionView(
                              context, routes, _controller, bodyer, view);
                        } else if (state.view == Constant.CHATGROUP) {
                          return GroupChatView(context, _formCommentSubmit,
                              routes, commentController, _overlayEntry, view);
                        } else {
                          return SizedBox();
                        }
                      } else {
                        return SizedBox();
                      }
                    },
                  )
                ],
              ))),
    );
  }
}

StatelessWidget CommentInput(commentController) {
  return Container(
    margin: const EdgeInsets.only(top: 14),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 50, // Atur tinggi minimal yang diinginkan
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: bgColor3,
            borderRadius: BorderRadius.circular(Dimens.clipRounded),
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                  child: TextFormField(
                controller: commentController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                validator: FormValidator.taskSubmitValidate,
                style: thirdTextStyle,
                decoration: InputDecoration.collapsed(
                  hintText: TextApp.tfHintComment,
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

StatelessWidget DiscussionView(
    BuildContext context,
    ShowDiscussionArgument routes,
    WebViewController? controller,
    bodyer,
    int view) {
  return Container(
    height: Dimens.heighMax(context),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Header(context, routes, view),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(
              "Kelompok : ${routes.group?.name}",
              style: secondaryTextStyle.copyWith(fontSize: 18),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )),
        (routes.group?.discussion?.description != "")
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Deskripsi : ${routes.group?.discussion?.description}",
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                ))
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
              child: WebViewWidget(
                  controller: controller!
                    ..loadRequest(
                        Uri.parse('${Constant.baseUrl}showDiscussion'),
                        method: LoadRequestMethod.post,
                        headers: {
                          'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: Uint8List.fromList(utf8.encode(bodyer))))),
        ),
      ],
    ),
  );
}

StatelessWidget Header(
    BuildContext context, ShowDiscussionArgument routes, view) {
  return Container(
      height: 80,
      width: Dimens.widthMax(context),
      color: accentColor2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(
                Dimens.defaultMargin,
              ),
              child: Icon(
                Icons.arrow_back,
                color: secondaryColor,
              ),
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Text(
                  "Diskusi : ${routes.group?.discussion?.title}",
                  style: secondaryTextStyle.copyWith(fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
          ),
          BlocBuilder<DiscussionBloc, DiscussionState>(
            buildWhen: (prevState, state) =>
                state is DiscussionChangesViewState,
            builder: (context, state) {
              if (state is DiscussionChangesViewState) {
                view = state.view;
                if (view == Constant.CHATGROUP) {
                  GetStudentGroupCommentByGroupIdRequest request =
                      GetStudentGroupCommentByGroupIdRequest(
                          group_id: routes.group?.id ?? 0);
                  context.read<DiscussionBloc>().add(
                      DiscussionGetStudentGroupCommentByGroupIdEvent(
                          Constant.getToken(), request));
                }
              }
              return GestureDetector(
                  onTap: () {
                    context
                        .read<DiscussionBloc>()
                        .add(DiscussionChangesViewEvent(view));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(
                      Dimens.defaultMargin,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(Dimens.clipRounded),
                        ),
                        color: secondaryColor
                      ),
                      child: Icon(
                        (view == Constant.DISCUSSION)
                            ? Icons.mark_unread_chat_alt_outlined
                            : (view == Constant.CHATGROUP)
                                ? Icons.text_snippet_outlined
                                : Icons.ac_unit,
                        color: accentColor2,
                      ),
                    ),
                  ));
            },
          ),
        ],
      ));
}

StatelessWidget GroupChatView(
    BuildContext context,
    GlobalKey<FormState> formCommentSubmit,
    ShowDiscussionArgument routes,
    TextEditingController commentController,
    OverlayEntry? overlayEntry,
    int view) {
  return Container(
    height: Dimens.heighMax(context),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Header(context, routes, view),
        BlocBuilder<DiscussionBloc, DiscussionState>(
          buildWhen: (prevState, state) =>
              state is DiscussionGetStudentGroupCommentByGroupIdState,
          builder: (context, state) {
            if (state is DiscussionGetStudentGroupCommentByGroupIdState) {
              List<StudentGroupComment>? listStudentGroupComment =
                  state.entity.studentGroupComment ?? [];
              if (listStudentGroupComment.isEmpty) {
                return Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimens.clipRounded),
                          topRight: Radius.circular(Dimens.clipRounded),
                        ),
                        color: bgColor1,
                      ),
                      padding: EdgeInsets.only(top: 24),
                      child: Center(
                        child: Text(TextApp.nothingDiscussion),
                      )),
                );
              } else {
                return Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimens.clipRounded),
                        topRight: Radius.circular(Dimens.clipRounded),
                      ),
                      color: bgColor1,
                    ),
                    padding: EdgeInsets.only(top: 24),
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        children: state.entity.studentGroupComment!
                            .map(
                                (item) => ItemGroupCommentWidget(context, item))
                            .toList(),
                      ),
                    ),
                  ),
                );
              }
            } else if (state is MateriLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimens.clipRounded),
                        topRight: Radius.circular(Dimens.clipRounded),
                      ),
                      color: bgColor1,
                    ),
                    padding: EdgeInsets.only(top: 24),
                    child: Center(
                      child: Text(TextApp.somethingWrong),
                    )),
              );
            }
          },
        ),
        Form(
          key: formCommentSubmit,
          child: Container(
              width: Dimens.widthMax(context),
              padding: EdgeInsets.symmetric(
                  horizontal: Dimens.defaultMargin,
                  vertical: Dimens.defaultMargin / 2),
              color: accentColor2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CommentInput(commentController),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: GestureDetector(
                      onTap: () async {
                        if (Helper.validate(formCommentSubmit)) {
                          SendStudentGroupCommentRequest request =
                              SendStudentGroupCommentRequest(
                                  group_id: routes.group?.id ?? 0,
                                  message: commentController.text);
                          context.read<DiscussionBloc>().add(
                              DiscussionSendStudentGroupCommentEvent(
                                  Constant.getToken(), request));
                          commentController.clear();
                        }
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(Dimens.clipRounded),
                          ),
                          color: primaryColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.send,
                              color: secondaryColor,
                              size: 24,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ],
    ),
  );
}

StatelessWidget ItemGroupCommentWidget(
    BuildContext context, StudentGroupComment studentGroupComment) {
  if (studentGroupComment.student?.id == Constant.getUserId()) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(0),
                  ),
                  color: accentColor2),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width -
                    70, // Mengatur lebar maksimum container mengikuti panjang teks
              ),
              child: IntrinsicWidth(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        child: Text("${studentGroupComment.message}",
                            style: normalTextStyle.copyWith(
                                color: secondaryColor)),
                      ),
                    ),
                    Container(
                      child: PopupMenuButton<CommentOptions>(
                        color: secondaryColor,
                        onSelected: (CommentOptions option) {
                          if (option == CommentOptions.delete) {
                            UpdateHideStudentGroupCommentRequest request =
                                UpdateHideStudentGroupCommentRequest(
                              comment_id: studentGroupComment.id ?? 0,
                              group_id: studentGroupComment.groupId ?? 0,
                            );

                            context.read<DiscussionBloc>().add(
                                DiscussionUpdateHideStudentDiscussionCommentEvent(
                                    request, Constant.getToken()));
                          }
                        },
                        itemBuilder: (BuildContext context) => commentOptions,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  } else if (studentGroupComment.userId != 0 &&
      studentGroupComment.studentId == 0) {
    Color userColor =
        generateUserColor(studentGroupComment.student?.id.toString() ?? "");
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(20),
                  ),
                  color: bgColor3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${studentGroupComment.user?.name}",
                    style: normalTextStyle.copyWith(
                        fontWeight: FontWeight.bold, color: userColor),
                  ),
                  Text(
                    "(Pembimbing)",
                    style: normalTextStyle.copyWith(
                        fontSize: 10, color: primaryColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("${studentGroupComment.message}"),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  } else {
    Color userColor =
        generateUserColor(studentGroupComment.student?.id.toString() ?? "");
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(20),
                  ),
                  color: bgColor3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${studentGroupComment.student?.name}",
                    style: normalTextStyle.copyWith(
                        fontWeight: FontWeight.bold, color: userColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("${studentGroupComment.message}"),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

BlocBuilder<DiscussionBloc, DiscussionState> ChatGroup(
    BuildContext context, int view, ShowDiscussionArgument routes) {
  return BlocBuilder<DiscussionBloc, DiscussionState>(
    buildWhen: (prevState, state) => state is DiscussionChangesViewState,
    builder: (context, state) {
      if (state is DiscussionChangesViewState) {
        view = state.view;
        if (view == Constant.CHATGROUP) {
          GetStudentGroupCommentByGroupIdRequest request =
              GetStudentGroupCommentByGroupIdRequest(
                  group_id: routes.group?.id ?? 0);
          context.read<DiscussionBloc>().add(
              DiscussionGetStudentGroupCommentByGroupIdEvent(
                  Constant.getToken(), request));
        }
      }
      return Padding(
        padding: EdgeInsets.only(top: 10),
        child: FloatingActionButton(
          onPressed: () {
            context
                .read<DiscussionBloc>()
                .add(DiscussionChangesViewEvent(view));
          },
          backgroundColor: secondaryColor,
          child: Icon(
            (view == Constant.DISCUSSION)
                ? Icons.mark_unread_chat_alt_outlined
                : (view == Constant.CHATGROUP)
                    ? Icons.text_snippet_outlined
                    : Icons.ac_unit,
            color: accentColor2,
          ),
        ),
      );
    },
  );
}

Color generateUserColor(String userId) {
  int hashCode = userId.hashCode;
  int hue = hashCode % 360;
  return HSLColor.fromAHSL(1.0, hue.toDouble(), 0.6, 0.5).toColor();
}

enum CommentOptions { delete }

List<PopupMenuItem<CommentOptions>> commentOptions = [
  PopupMenuItem<CommentOptions>(
    value: CommentOptions.delete,
    child: Text('Delete'),
  ),
];
