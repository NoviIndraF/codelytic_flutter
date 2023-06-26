import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/helper.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/request/materi/get_chapter_by_materi_id_request.dart';
import 'package:codelytic/presentation/bloc/materi/materi_bloc.dart';
import 'package:codelytic/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ItemMateriWidget extends StatelessWidget {
  ItemMateriWidget(this.title, this.description, this.createdAt, this. id, {Key? key}) : super(key: key);

  String? title;
  String? description;
  String? createdAt;
  int? id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 8),
      child: GestureDetector(
        onTap: (){
          GetChapterByMateriIdRequest getChapterByMateriIdRequest = GetChapterByMateriIdRequest(materi_id: id.toString());
          final sToken =Constant.getToken();
          context
              .read<MateriBloc>()
              .add(MateriChapterByMateriIdEvent(sToken, getChapterByMateriIdRequest));

          Navigator.pushNamed(context, AppRoute.materiChapter);
        },
        child: Container(
          height: 140,
          padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: bgColor3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title??"",
                          style: subtitleTextStyle2.copyWith(
                              fontSize: 16
                          ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        description??"",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                          'Created : ${Helper.convertDate(createdAt??"")}',
                          style: accentTextStyle2.copyWith(
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
              Container(
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
                      color: primaryColor
                  ),
                  child: Container(
                    child: SvgPicture.asset(
                      'assets/icons/ic-materi.svg',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
