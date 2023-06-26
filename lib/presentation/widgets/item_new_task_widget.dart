import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/request/task/show_task_request.dart';
import 'package:codelytic/data/model/response/task/task.dart';
import 'package:codelytic/presentation/bloc/task/task_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ItemNewTaskWidget extends StatelessWidget {
  ItemNewTaskWidget(this.task, this.index, {Key? key}) : super(key: key);
  Task? task;
  int? index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoute.taskDetail,
              arguments: ShowTaskArgument(index: index, task: task));
        },
        child: Container(
          height: 100,
          width: 280,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: bgColor3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
          Container(
          padding: EdgeInsets.all(10),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(Dimens.clipRounded/2)),
              color: accentColor
          ),
          child: Container(
            child: SvgPicture.asset(
              'assets/icons/ic-task.svg',
              width: 20,
              height: 20,
            ),
          ),
        ),
                  (task?.checked ?? false)
                      ? Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: accentColor2,
                                borderRadius:
                                    BorderRadius.circular(Dimens.clipRounded)),
                            child: Icon(
                              Icons.check,
                              color: secondaryColor,
                            ),
                          ))
                      : SizedBox()
                ],
              ),
              SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${task?.title}",
                      style: subtitleTextStyle2.copyWith(fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${task?.description}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Deadline : ${task?.deadline} ",
                      style: accentTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
