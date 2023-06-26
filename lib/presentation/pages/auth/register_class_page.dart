import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/request/authentication/get_room_by_code_request.dart';
import 'package:codelytic/data/model/request/authentication/register_room_request.dart';
import 'package:codelytic/domain/entities/authentication/get_room_by_code_response_entity.dart';
import 'package:codelytic/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterClassPage extends StatelessWidget {
  RegisterClassPage({Key? key}) : super(key: key);
  final TextEditingController codeClassController = TextEditingController();
  String token = '';

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(AuthCheckEvent());

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthHasToken){
          token = state.result;
        }
        if (state is AuthRegisteredRoom){

          context.read<AuthBloc>().add(AuthSaveRoomIdEvent(state.result.room_id.toString()??""));
          context.read<AuthBloc>().add(AuthCheckFirstEvent());
        }
        if(state is AuthHasFirstState){
          if(state.result == "1"){
            Navigator.popAndPushNamed(context, AppRoute.main);
          } else{
            Navigator.popAndPushNamed(context, AppRoute.intro);
          }
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            body: Container(
              padding: EdgeInsets.only(
                top: Dimens.defaultMargin,
                right: Dimens.defaultMargin,
                left: Dimens.defaultMargin,
              ),
              color: bgColor2,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum memiliki kelas?",
                        style: subtitleTextStyle.copyWith(
                          fontSize: 20,
                          color: secondaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: Dimens.widthMax(context),
                        padding: EdgeInsets.all(Dimens.defaultMargin),
                        decoration: BoxDecoration(
                            color: bgColor1,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dimens.clipRounded))),
                        child: classEmpty(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
        },
      ),
    );
  }

  StatelessWidget codeClassInput() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          TextApp.tfCodeClass,
          style: subtitleTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: bgColor3,
            borderRadius: BorderRadius.circular(Dimens.clipRounded),
          ),
          child: Center(
            child: Row(
              children: [
                Icon(
                  Icons.class_outlined,
                  color: primaryColor,
                ),
                const SizedBox(width: 16),
                Expanded(
                    child: TextFormField(
                  controller: codeClassController,
                  style: thirdTextStyle,
                  decoration: InputDecoration.collapsed(
                    hintText: TextApp.tfHintCodeClass,
                    hintStyle: hintTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  BlocBuilder<AuthBloc, AuthState> classEmpty(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Container(
          child: Column(
            children: [
              Text(
                "Masukkan Code Kelas Anda",
                style: subtitleTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              codeClassInput(),
              (state is AuthGetRoomByCode)
                  ? (state.result.id == null)
                      ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Data kelas tidak tersedia"),
                      )
                      : itemClassWidget(context,  state.result)
                  : SizedBox(),
              (state is AuthLoading) ? CircularProgressIndicator() : SizedBox(),
              btnChekCodeClassButton(context),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Code kelas ini didapat dari guru/admin anda yang telah membuat kelas sebelumnya. Jika anda belum mempunyai kode kelas, silahkan hubungi guru/admin."),
            ],
          ),
        );
      },
    );
  }

  StatelessWidget btnChekCodeClassButton(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      child: TextButton(
          onPressed: () {
            GetRoomByCodeRequest request =
                GetRoomByCodeRequest(code: codeClassController.text);

            context
                .read<AuthBloc>()
                .add(AuthGetRoomByCodeEvent(token, request));
          },
          style: TextButton.styleFrom(
            backgroundColor: accentColor2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Text(
            TextApp.btnCheckReedemCodeClass,
            style: secondaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          )),
    );
  }

  StatelessWidget itemClassWidget(
    BuildContext context,
      GetRoomByCodeResponseEntity data
  ) {
    return GestureDetector(
      onTap: () {
        RegisterRoomRequest request =
        RegisterRoomRequest(
          code: data.code??'',
          room_id: data.id??0,
        );

        context.read<AuthBloc>().add(AuthRegisterRoomEvent(token, request));
        context.read<AuthBloc>().add(AuthSaveCodeRoomEvent(data.code ?? ""));
      },
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 4,
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
                  Container(
                    padding: EdgeInsets.all(Dimens.defaultMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name ?? "",
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          data.major ?? "",
                          style: blackTextStyle.copyWith(
                              fontSize: 10, color: primaryColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          data.user?.name ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
