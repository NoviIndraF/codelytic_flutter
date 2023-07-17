
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/response/authentication/get_student_room_response.dart';
import 'package:codelytic/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

StatelessWidget ItemClassWidget(BuildContext context, Data data) {
  return GestureDetector(
    onTap: () {
      context.read<AuthBloc>().add(AuthSaveCodeRoomEvent(data.code ?? ""));
      context
          .read<AuthBloc>()
          .add(AuthSaveRoomIdEvent(data.roomId.toString() ?? ""));
    },
    child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(Dimens.defaultMargin),
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.all(Radius.circular(Dimens.clipRounded)),
            color: bgColor3,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(Dimens.defaultMargin),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.all(Radius.circular(Dimens.clipRounded)),
                  color: accentColor2,
                ),
                child: Icon(
                  Icons.class_,
                  color: secondaryColor,
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(Dimens.defaultMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.room.name ?? "",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        data.room.major ?? "",
                        style: blackTextStyle.copyWith(
                            fontSize: 10, color: primaryColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        data.room.user.name ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}