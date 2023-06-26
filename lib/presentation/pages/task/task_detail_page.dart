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
import 'package:codelytic/data/model/request/materi/show_chapter_request.dart';
import 'package:codelytic/data/model/request/task/get_student_task_by_room_id_request.dart';
import 'package:codelytic/data/model/request/task/show_task_request.dart';
import 'package:codelytic/data/model/request/task/submit_task_request.dart';
import 'package:codelytic/presentation/bloc/materi/materi_bloc.dart';
import 'package:codelytic/presentation/bloc/task/task_bloc.dart';
import 'package:codelytic/presentation/widgets/show_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TaskDetailPage extends StatefulWidget {
  TaskDetailPage({Key? key}) : super(key: key);
  @override
  State<TaskDetailPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<TaskDetailPage> {
  WebViewController? _controller;
  int index = 0;
  var bodyer;
  TextEditingController taskController = TextEditingController();
  final GlobalKey<FormState> _formTaskSubmit = GlobalKey<FormState>();

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
    ShowTaskArgument routes =
        ModalRoute.of(context)!.settings.arguments as ShowTaskArgument;

    bodyer = Helper.convertMapToFormUrlEncoded(
        ContentChapterRequest(content: "${routes.task?.content}").toMap());

    index = routes.index!;
    return BlocListener<TaskBloc, TaskState>(
  listener: (context, state) {

  },
  child: SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Container(
          height: Dimens.heighMax(context) / 3,
          color: accentColor,
        ),
        Container(
          height: Dimens.heighMax(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 60,
                  width: Dimens.widthMax(context),
                  color: accentColor,
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
                              "Tugas : ${routes.task?.title}",
                              style: secondaryTextStyle.copyWith(fontSize: 16),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ),
                    ],
                  )),
              (routes.task?.description != "")
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Deskripsi : ${routes.task?.description}",
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
                        controller: _controller!
                          ..loadRequest(
                              Uri.parse('${Constant.baseUrl}showTask'),
                              method: LoadRequestMethod.post,
                              headers: {
                                'Content-Type':
                                    'application/x-www-form-urlencoded',
                              },
                              body: Uint8List.fromList(utf8.encode(bodyer))))),
              ),
              Container(
                  width: Dimens.widthMax(context),
                  color: bgColor3,
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "Deadline : ${routes.task?.deadline}",
                        style: accentTextStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      (routes.task?.checked ?? false)
                          ? Container(
                        decoration: BoxDecoration(
                            color: accentColor2,
                            borderRadius:
                            BorderRadius.circular(Dimens.clipRounded)),
                        child: Icon(
                          Icons.check,
                          color: secondaryColor,
                        ),
                      )
                          : SizedBox()
                    ],
                  )),
              (routes.task?.note != "")
                  ? Container(
                      color: accentColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Text(
                        "Catatan : ${routes.task?.note}",
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      ))
                  : SizedBox(),
              Form(
                key: _formTaskSubmit,
                child: Container(
                    height: 80,
                    width: Dimens.widthMax(context),
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimens.defaultMargin),
                    color: accentColor,
                    child: Row(
                      children: [
                        Expanded(
                          child: taskInput(),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          child: GestureDetector(
                              onTap: () async {
                                  if(Helper.validate(_formTaskSubmit)){

                                    var confirm = ShowWidget.confirmDialog(
                                        context,
                                        (routes.task?.checked?? false) ? TextApp.taskHasSubmitted : TextApp.confirmSubmitTask
                                    );
                                    if (await confirm) {
                                      SubmitTaskRequest request = SubmitTaskRequest(
                                        task_id: routes.task?.id ??0,
                                        room_id: Constant.getRoomId(),
                                        answer: taskController.text,
                                        sended: Helper.getDateTimeNow(true, true),
                                      );

                                      context.read<TaskBloc>().add(TaskSubmitEvent(
                                        Constant.getToken(),
                                        request,
                                      ));

                                      GetStudentTaskByRoomIdRequest getStudentTaskByRoomIdRequest =
                                      GetStudentTaskByRoomIdRequest(room_id: Constant.getRoomId());
                                      context.read<TaskBloc>().add(TaskGetStudentTaskByRoomIdEvent(
                                          getStudentTaskByRoomIdRequest, Constant.getToken()));

                                      Navigator.pop(context);
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
        )
      ],
    ))),
);
  }

  StatelessWidget taskInput() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
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
                  controller: taskController,

                      validator: FormValidator.taskSubmitValidate,
                  style: thirdTextStyle,
                  decoration: InputDecoration.collapsed(
                    hintText: TextApp.tfHintTask,
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
}
