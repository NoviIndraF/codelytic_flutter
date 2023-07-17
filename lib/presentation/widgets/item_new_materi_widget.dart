import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/helper.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/request/materi/get_chapter_by_materi_id_request.dart';
import 'package:codelytic/presentation/bloc/materi/materi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ItemNewMateriWidget extends StatelessWidget {
  ItemNewMateriWidget(this.title, this.description, this.createdAt, this.id,
      {Key? key})
      : super(key: key);
  String? title;
  String? description;
  String? createdAt;
  int? id;

  @override
  Widget build(BuildContext context) {
    createdAt = Helper.convertDate(createdAt ?? "");
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        onTap: () {
          GetChapterByMateriIdRequest getChapterByMateriIdRequest =
              GetChapterByMateriIdRequest(materi_id: id.toString());
          final sToken = Constant.getToken();
          context.read<MateriBloc>().add(MateriChapterByMateriIdEvent(
              sToken, getChapterByMateriIdRequest));

          Navigator.pushNamed(context, AppRoute.materiChapter);
        },
        child: Container(
          height: 100,
          width: 280,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.clipRounded),
            color: bgColor3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(Dimens.clipRounded / 2)),
                    color: primaryColor),
                child: Container(
                  child: SvgPicture.asset(
                    'assets/icons/ic-materi.svg',
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title ?? "",
                      style: subtitleTextStyle2.copyWith(fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    description == ""
                        ? SizedBox()
                        : Text(
                            description ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                    Text(
                      'Dibuat : $createdAt ',
                      style: accentTextStyle2.copyWith(
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
