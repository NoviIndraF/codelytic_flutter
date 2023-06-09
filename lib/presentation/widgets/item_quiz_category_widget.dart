import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/theme.dart';
import 'package:flutter/material.dart';

class ItemQuizCategoryWidget extends StatelessWidget {
  final String level;
  late final int leveling;
  final description;
  ItemQuizCategoryWidget(
    this.level,
    this.leveling,
    this.description, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, AppRoute.quiz);
        },
        child: Container(
          height: 120,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: bgColor3,
          ),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.all(Radius.circular(Dimens.clipRounded)),
                  color: accentColor3,
                ),
                child: Icon(
                  Icons.star,
                  color: secondaryColor,
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(level,
                          style: subtitleTextStyle2.copyWith(fontSize: 16)),
                      Row(
                        children: [
                          for (int i = 0; i < leveling; i++)
                            Icon(
                              Icons.star,
                              color: accentColor3,
                            ),
                        ],
                      ),
                      Text(
                        description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
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
