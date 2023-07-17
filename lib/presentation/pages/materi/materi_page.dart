import 'package:codelytic/app.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/request/materi/get_materi_by_room_id_request.dart';
import 'package:codelytic/presentation/bloc/materi/materi_bloc.dart';
import 'package:codelytic/presentation/pages/home/home_page.dart';
import 'package:codelytic/presentation/widgets/item_materi_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MateriPage extends StatelessWidget {
  MateriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetMateriByRoomIdRequest requestMateri =
    GetMateriByRoomIdRequest(room_id: Constant.getRoomId().toString());

    context
        .read<MateriBloc>()
        .add(MateriGetMateriByRoomIdEvent(Constant.getToken(), requestMateri));

    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
      Column(
        children: [
          Container(
            height: Dimens.heighMax(context)*0.3,
            color: primaryColor,
          ),
          Expanded(
            child: Container(
              color: bgColor1,
            ),
          ),
        ],
      ),
      SingleChildScrollView(
        child: Column(
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
                    Text(
                      "Materi",
                      style: secondaryTextStyle.copyWith(fontSize: 20),
                    ),
                  ],
                )),
            Container(
                width: Dimens.widthMax(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimens.clipRounded),
                    topLeft: Radius.circular(Dimens.clipRounded),
                  ),
                  color: bgColor1,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 24, right: 24, left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 8,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(Dimens.clipRounded),
                            ),
                            color: primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Text(
                        "List Materi",
                        style: subtitleTextStyle,
                      ),
                      Content(context),
                      SizedBox(
                        height: 28,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      )
        ]),
      ),
    );
  }
}

StatelessWidget Content(BuildContext context) {
  return Container(
    child: BlocBuilder<MateriBloc, MateriState>(
      buildWhen: (previousState, state){
        return state is MateriGetMateriByRoomIdState;
      },
      builder:
          (context, state) {
        if (state is MateriGetMateriByRoomIdState) {
          if (state.getMateriByRoomIdResponseEntity.materi!.isEmpty) {
            return Container(
                height: 140,
                margin: EdgeInsets.only(
                  left: Dimens.defaultMargin,
                ),
                child: Center(
                  child: Text(TextApp.nothingMateri),
                ));
          } else {
            return
              Column(
              children: state.getMateriByRoomIdResponseEntity.materi!
                  .map((item) => ItemMateriWidget(
                        item.title,
                        item.description,
                        item.createdAt,
                        item.id,
                      ))
                  .toList(),
            );
          }
        } else if (state is MateriLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
              height: 140,
              margin: EdgeInsets.only(
                top: 12,
                left: Dimens.defaultMargin,
              ),
              child: Center(
                child: Text(TextApp.somethingWrong),
              ));
        }
      },
    ),
  );
}
