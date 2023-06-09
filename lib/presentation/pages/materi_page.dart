import 'package:codelytic/app.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/presentation/widgets/item_materi_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MateriPage extends StatelessWidget {
  const MateriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

      body: Stack(children: [
        Container(
          height: Dimens.heighMax(context),
          color: primaryColor,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 80,
                  width: Dimens.widthMax(context),
                  color: primaryColor,
                  child:
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){Navigator.pop(context);},
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
                        style: secondaryTextStyle.copyWith(
                          fontSize: 20
                        ),
                      ),
                    ],
                  )
              ),
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
                  padding: EdgeInsets.only(
                      top: 24,
                      right: 24,
                      left: 24
                  ),
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
                      SizedBox(height: 28,),
                      Text(
                          "List Materi",
                        style: subtitleTextStyle,
                      ),
                      content(context),
                      SizedBox(height: 28,),
                    ],
                  ),
                )
              )
            ],
          ),
        )
      ]),
    ));
  }

  Column content (BuildContext context){
    return Column(
        children : [
          ItemMateriWidget(),
          ItemMateriWidget(),
          ItemMateriWidget(),
          ItemMateriWidget(),
          ItemMateriWidget(),
        ]
    );
  }
}
