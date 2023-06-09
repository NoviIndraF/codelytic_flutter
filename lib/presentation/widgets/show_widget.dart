import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowWidget {
  static void showSnackBar(
      BuildContext context, String message, String status) {
    final snackBar = SnackBar(
      content: Text('$message'),
      backgroundColor: (status == 'error')
          ? Colors.red
          : (status == 'success')
              ? Colors.green
              : Colors.blue,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(20),
      elevation: 30,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void dialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Stack(
            children: [
              Dialog(
                elevation: 0,
                backgroundColor: bgColor1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 200,
                    width: 60,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                message,
                                style: TextStyle(fontSize: 12),
                              ),
                              Spacer(),
                              Container(
                                width: 200,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor:accentColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    child: Text(
                                      "Tutup",
                                      style: secondaryTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: medium,
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  right: 0,
                  left: 0,
                  bottom: 200,
                  top: 0,
                  child: Center(
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(80)
                            ),
                            color: bgColor3,
                            border: Border.all(
                                width: 4,
                                color: accentColor3
                            )
                        ),
                        child: Icon(Icons.warning_amber, color: accentColor3, size: 40,),
                      )
                  )
              ),
            ],

          );
        });
  }

  static Future<bool> confirmDialog(
    BuildContext context,
    String message,
  ) async {
    bool confirm = false;
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Stack(
            children: [
              Dialog(
                elevation: 0,
                backgroundColor: bgColor1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimens.clipRounded),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 180,
                    width: 60,
                    child:
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                message,
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                        style: TextButton.styleFrom(
                                          backgroundColor:primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                        child: Text(
                                          "Batal",
                                          style: secondaryTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: medium,
                                          ),
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    width: 28,
                                  ),
                                  Expanded(
                                    child: TextButton(
                                        onPressed: () {
                                          confirm = true;
                                          Navigator.of(context).pop();
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: accentColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                        child: Text(
                                          "Oke",
                                          style: secondaryTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: medium,
                                          ),
                                        )
                                    )
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                  ),
                ),
              ),

              Positioned(
                  right: 0,
                  left: 0,
                  bottom: 200,
                  top: 0,
                  child: Center(
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(80)
                          ),
                          color: bgColor3,
                          border: Border.all(
                            width: 4,
                            color: accentColor3
                          )
                        ),
                        child: Icon(Icons.warning_amber, color: accentColor3, size: 40,),
                      )
                  )
              ),
            ],
          );
        });
    return confirm;
  }
}
