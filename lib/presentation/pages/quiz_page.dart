import 'package:codelytic/app.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/presentation/widgets/item_materi_widget.dart';
import 'package:codelytic/presentation/widgets/item_new_quiz_widget.dart';
import 'package:codelytic/presentation/widgets/item_quiz_category_widget.dart';
import 'package:codelytic/presentation/widgets/item_quiz_widget.dart';
import 'package:codelytic/presentation/widgets/item_task_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          body: Stack(children: [
            Container(
              height: Dimens.heighMax(context),
              color: accentColor3,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: 80,
                      width: Dimens.widthMax(context),
                      color: accentColor3,
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
                            "Kuis",
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
                                  color: accentColor3,
                                ),
                              ),
                            ),
                            SizedBox(height: 28,),
                            Text(
                              "List Kuis",
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

  StatelessWidget content (BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 14),
      width: double.infinity,
      child: Center(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            ItemQuizWidget(),
            ItemQuizWidget(),
            ItemQuizWidget(),
            ItemQuizWidget(),
            ItemQuizWidget(),
            ItemQuizWidget(),
            ItemQuizWidget(),
            ItemQuizWidget(),
          ],
        ),
      ),
    );
  }
}
