import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/data/model/request/home/get_materi_by_room_code_request.dart';
import 'package:codelytic/presentation/bloc/home/home_bloc.dart';
import 'package:codelytic/presentation/widgets/item_new_materi_widget.dart';
import 'package:codelytic/presentation/widgets/item_new_quiz_widget.dart';
import 'package:codelytic/presentation/widgets/item_new_task_widget.dart';
import 'package:codelytic/presentation/widgets/show_widget.dart';
import 'package:flutter/material.dart';
import 'package:codelytic/common/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  String token = "";
  String codeRoom = "";
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeGetTokenAndCodeState) {
          token = state.token;
          codeRoom = state.code;
          GetAllDataByRoomCodeRequest request =
              GetAllDataByRoomCodeRequest(code: codeRoom);
          context
              .read<HomeBloc>()
              .add(HomeGetAllDataByRoomCodeEvent(token, request));
        }
        if (state is HomeErrorState) {
          ShowWidget.dialog(context, state.message);
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            context.read<HomeBloc>().add(HomeGetTokenAndCodeEvent());
          }
          return Stack(children: [
            Container(
              height: Dimens.heighMax(context),
              color: primaryColor,
            ),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30.0,
                        left: 18.0,
                        right: 18.0,
                        bottom: 18.0,
                      ),
                      child: Container(
                          height: Dimens.heighMax(context) * 0.3,
                          width: Dimens.widthMax(context),
                          color: primaryColor,
                          child: Column(
                            children: [
                              BlocBuilder<HomeBloc, HomeState>(
                                builder: (context, state) {
                                  if (state is HomeGetAllDataByRoomCodeState) {
                                    return header(state);
                                  } else if (state is HomeLoading) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  } else {
                                    return SizedBox();
                                  }
                                },
                              ),
                              menu(context),
                            ],
                          )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimens.clipRounded),
                          topLeft: Radius.circular(Dimens.clipRounded),
                        ),
                        color: secondaryColor,
                      ),
                      child: content(context),
                    ),
                  ],
                ),
              ),
            )
          ]);
        },
      ),
    );
  }

  StatelessWidget menu(BuildContext context) {
    return Container(
      height: 160,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.materi);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Column(
                      children: [
                        Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Dimens.clipRounded)),
                              border: Border.all(
                                color: secondaryColor, // Warna border
                                width: 2.0, // Lebar border
                              ),
                            ),
                            child: Icon(
                              Icons.book,
                              color: secondaryColor,
                            )),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Materi',
                              style: secondaryTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.task);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Column(
                      children: [
                        Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: accentColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(Dimens.clipRounded),
                              ),
                              border: Border.all(
                                color: secondaryColor, // Warna border
                                width: 2.0, // Lebar border
                              ),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: secondaryColor,
                            )),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Tugas',
                              style: secondaryTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.quizCategory);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Column(
                      children: [
                        Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: accentColor3,
                              borderRadius: BorderRadius.all(
                                Radius.circular(Dimens.clipRounded),
                              ),
                              border: Border.all(
                                color: secondaryColor, // Warna border
                                width: 2.0, // Lebar border
                              ),
                            ),
                            child: Icon(
                              Icons.star,
                              color: secondaryColor,
                            )),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Kuis',
                              style: secondaryTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Column(
                    children: [
                      Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: accentColor2,
                            borderRadius: BorderRadius.all(
                              Radius.circular(Dimens.clipRounded),
                            ),
                            border: Border.all(
                              color: secondaryColor, // Warna border
                              width: 2.0, // Lebar border
                            ),
                          ),
                          child: Icon(
                            Icons.chat,
                            color: secondaryColor,
                          )),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Diskusi',
                            style: secondaryTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Tambahkan container lain sesuai kebutuhan Anda
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column content(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 14.0),
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
            ),
            announcementTitle(),
            newMateriTitle(),
            newMateris(),
            newTugasTitle(),
            newTasks(),
            newQuisTitle(),
            newQuiz(),

            SizedBox(height: 20,)
          ],
        ),
      ],
    );
  }

  StatelessWidget newMateriTitle() {
    return Container(
      margin: EdgeInsets.only(
          top: Dimens.defaultMargin,
          left: Dimens.defaultMargin,
          right: Dimens.defaultMargin),
      child: Text('Materi Terbaru', style: subtitleTextStyle),
    );
  }

  StatelessWidget newMateris() {
    return Container(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeGetAllDataByRoomCodeState) {
            print(state.toString());
            return Container(
              height: 140,
              margin: EdgeInsets.only(
                top: 12,
                left: Dimens.defaultMargin,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.getAllDataByRoomCodeEntity.materi!
                      .map((item) => ItemNewMateriWidget(
                            item.title,
                            item.description,
                            item.createdAt,
                          ))
                      .toList(),
                ),
              ),
            );
          } else if (state is HomeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  StatelessWidget announcementTitle() {
    return Container(
      margin: EdgeInsets.only(
          top: Dimens.defaultMargin,
          left: Dimens.defaultMargin,
          right: Dimens.defaultMargin),
    );
  }

  StatelessWidget newTugasTitle() {
    return Container(
      margin: EdgeInsets.only(
          top: Dimens.defaultMargin,
          left: Dimens.defaultMargin,
          right: Dimens.defaultMargin),
      child: Text('Tugas Terbaru', style: subtitleTextStyle),
    );
  }

  StatelessWidget newTasks() {
    return Container(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeGetAllDataByRoomCodeState) {
            return Container(
              height: 140,
              margin: EdgeInsets.only(
                top: 12,
                left: Dimens.defaultMargin,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                    height: 140,
                    child: Row(
                      children: state.getAllDataByRoomCodeEntity.task!
                          .map((item) => ItemNewTaskWidget(
                                item.title,
                                item.description,
                                item.deadline,
                              ))
                          .toList(),
                    )),
              ),
            );
          } else if (state is HomeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  StatelessWidget newQuisTitle() {
    return Container(
      margin: EdgeInsets.only(
          top: Dimens.defaultMargin,
          left: Dimens.defaultMargin,
          right: Dimens.defaultMargin),
      child: Text('Kuis Terbaru', style: subtitleTextStyle),
    );
  }

  StatelessWidget newQuiz() {
    return Container(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeGetAllDataByRoomCodeState) {
            return Container(
              margin: EdgeInsets.only(
                top: 12,
                left: Dimens.defaultMargin,
              ),
              child: SingleChildScrollView(
                child: Container(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: state.getAllDataByRoomCodeEntity.quiz!
                        .map((item) => ItemNewQuizWidget(
                            item.title, item.description, 4))
                        .toList(),
                  ),
                ),
              ),
            );
          } else if (state is HomeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  StatelessWidget header(HomeGetAllDataByRoomCodeState state){
    return Container(
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 16,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/img-profile.png')),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                mainAxisAlignment:
                MainAxisAlignment.start,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo Selamat Datang,',
                    style: secondaryTextStyle
                        .copyWith(),
                  ),
                  Text(
                    state.studentEntity.name ?? "",
                    style:
                    secondaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.only(right: 24),
              child: Icon(
                Icons.notifications_active_outlined,
                color: secondaryColor,
              )),
        ],
      ),
    );
  }
}
