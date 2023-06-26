import 'package:codelytic/app.dart';
import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/presentation/widgets/item_materi_widget.dart';
import 'package:codelytic/presentation/widgets/item_quiz_category_widget.dart';
import 'package:codelytic/presentation/widgets/item_task_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizCategoryPage extends StatelessWidget {
  const QuizCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

      body: Stack(
          children: [
        Column(
          children: [
            Container(
              height: Dimens.heighMax(context)*0.3,
              color: accentColor3,
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
                          "Kuis Kategori",
                        style: secondaryTextStyle.copyWith(
                          fontSize: 20
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoute.quizAllHistory);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Icon(
                            Icons.history,
                            color: secondaryColor,
                            size: 32,
                          ),
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
                          "List Kategori Kuis",
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
          ItemQuizCategoryWidget('Mudah', 1, 'Kuis dengan pertanyaan paling mudah'),
          ItemQuizCategoryWidget('Normal', 2, 'Kuis dengan pertanyaan kesulitan normal'),
          ItemQuizCategoryWidget('Sulit', 3, 'Kuis dengan pertanyaan kesulitan tinggi'),
          ItemQuizCategoryWidget('Expert', 4, 'Kuis dengan pertanyaan kesulitan sangat tinggi'),
        ]
    );
  }
}
