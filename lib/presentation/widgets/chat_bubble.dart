import 'package:codelytic/common/dimens.dart';
import 'package:flutter/material.dart';
import 'package:codelytic/common/theme.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    this.text = '',
    this.isSender= false,
    this.hasProduct= false,
    Key? key}) : super(key: key);

  final String text;
  final bool isSender;
  final bool hasProduct;

  @override
  Widget build(BuildContext context) {

    Widget productPreview(){
      return Container(
        width: 230,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isSender?12:0),
              topRight: Radius.circular(isSender?0:12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            color: isSender?bgColor5 : bgColor4
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                   'assets/images/img-shoes.png',
                    width:70
                  ),
                ),
                SizedBox(width: 8,),
                Expanded(child: Column(
                  children: [
                    Text(
                      'COURT VISION 2.0 SHOES',
                      style: primaryTextStyle,
                    ),
                    SizedBox(height: 4,),
                    Text(
                      '\$57,15',
                      style: linkTextStyle.copyWith(
                        fontWeight: medium
                      ),
                    )
                  ],
                ))
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                OutlinedButton(
                    onPressed: (){},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: primaryColor
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    child: Text(
                        'Add to Cart',
                      style: linkTextStyle,
                    )
                ),
                SizedBox(width: 8,),
                TextButton(
                    onPressed: (){},
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )
                    ),
                    child: Text(
                        'Buy Now',
                      style: TextStyle(fontWeight: medium, color: bgColor5),
                    ),
                )
              ],
            )
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: Dimens.defaultMargin),
      child: Column(
        crossAxisAlignment: isSender? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasProduct?productPreview():SizedBox(),
          Row(
            mainAxisAlignment: isSender? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender?12:0),
                      topRight: Radius.circular(isSender?0:12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: isSender?bgColor5 : bgColor4
                  ),
                  child: Text(
                    text,
                    style: primaryTextStyle,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
