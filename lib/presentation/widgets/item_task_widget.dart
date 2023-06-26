import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/request/task/show_task_request.dart';
import 'package:codelytic/data/model/response/task/get_task_by_room_code_response.dart';
import 'package:codelytic/data/model/response/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemTaskWidget extends StatelessWidget {
  ItemTaskWidget(this.index, this.task, {Key? key}) : super(key: key);
  int? index;
  Task? task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 8),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, AppRoute.taskDetail, arguments: ShowTaskArgument(index: index, task: task));
    },
        child: Container(
          height: 128,
          padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: bgColor3,
          ),
          child: Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${task?.title}",
                          style: subtitleTextStyle2.copyWith(
                              fontSize: 16
                          ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "${task?.description}",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacer(),
                      Text(
                        "${task?.deadline}",
                          style: accentTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                          ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Stack(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimens.clipRounded)
                      ),
                      color: accentColor,
                    ),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dimens.clipRounded)
                        ),
                        color: primaryColor,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(12),
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
                          ),
                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
