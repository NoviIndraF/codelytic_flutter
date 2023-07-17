import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/helper.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/presentation/bloc/materi/materi_bloc.dart';
import 'package:codelytic/presentation/widgets/item_materi_chapter_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MateriChapterPage extends StatelessWidget {
  MateriChapterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Column(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryColor, bgGd1],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
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
                    height: 250,
                    width: Dimens.widthMax(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
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
                              "Sub Materi",
                              style: secondaryTextStyle.copyWith(fontSize: 20),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            right: Dimens.defaultMargin,
                            left: Dimens.defaultMargin,
                            bottom: Dimens.defaultMargin / 2,
                          ),
                          child: BlocBuilder<MateriBloc, MateriState>(
                            buildWhen: (context, state) =>
                                state is MateriGetChapterByMateriIdState,
                            builder: (context, state) {
                              if (state is MateriGetChapterByMateriIdState) {
                                return MateriDetailWidget(
                                  context,
                                  true,
                                  state.getChapterByMateriIdEntity.title ??
                                      ".....",
                                  state.getChapterByMateriIdEntity
                                          .description ??
                                      ".....",
                                  state.getChapterByMateriIdEntity.createdAt ??
                                      "...",
                                  state.getChapterByMateriIdEntity.updatedAt ??
                                      "...",
                                );
                              } else if (state is MateriLoading) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return MateriDetailWidget(
                                  context,
                                  false,
                                  ".....",
                                  ".....",
                                  "...",
                                  "...",
                                );
                              }
                            },
                          ),
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
                            "List SubMateri",
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
      buildWhen: (context, state) {
        return state is MateriGetChapterByMateriIdState;
      },
      builder: (context, state) {
        if (state is MateriGetChapterByMateriIdState) {
          if (state.getChapterByMateriIdEntity.chapter!.isEmpty) {
            return Container(
                height: 140,
                margin: EdgeInsets.only(
                  left: Dimens.defaultMargin,
                ),
                child: Center(
                  child: Text(TextApp.nothingMateri),
                ));
          } else {
            return Column(
              children: state.getChapterByMateriIdEntity.chapter!
                  .asMap()
                  .map((index, item) => MapEntry(
                        index,
                        ItemMateriChapterWidget(
                          item,
                          index,
                        ),
                      ))
                  .values
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

StatelessWidget MateriDetailWidget(
    BuildContext context,
    bool stateGetChapterByMateriId,
    String title,
    String description,
    String created,
    String updated) {
  return Container(
    height: 150,
    width: Dimens.widthMax(context),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(Dimens.clipRounded),
      ),
      color: secondaryColor,
    ),
    child: Center(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimens.defaultMargin,
            vertical: Dimens.defaultMargin ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: subtitleTextStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              description,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Created : ${Helper.convertDate(created)}",
                  overflow: TextOverflow.ellipsis,
                  style: accentTextStyle2.copyWith(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Updated : ${Helper.convertDate(created)}",
                  overflow: TextOverflow.ellipsis,
                  style: accentTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
