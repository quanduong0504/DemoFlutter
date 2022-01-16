
import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/resource/fonts.dart';
import 'package:exercise_example/resource/images.dart';
import 'package:flutter/material.dart';

class PaymentCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PaymentCardState();
  }
}

class _PaymentCardState extends BaseState<PaymentCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesResource.bg_payment_card),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: Image(image: AssetImage(ImagesResource.ic_bank), width: 18, height: 18, color: Colors.white)
                    ),
                    Expanded(
                        child:
                        Text('MANGO BANK', style: TextStyle(fontSize: 14, fontFamily: Fonts.Merienda, fontWeight: FontWeight.w300, color: Colors.white))
                    ),
                    Text('Payment', style: TextStyle(fontSize: 12, fontFamily: Fonts.Merienda, fontWeight: FontWeight.w600, color: Colors.white))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, left: 16),
                  child: Align(alignment: Alignment.centerLeft, child: Image(image: AssetImage(ImagesResource.ic_credit_card_chip), width: 50, height: 50))
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child:
                  Text(
                      '1234 6666 8888 6789',
                      style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 4, wordSpacing: 8, fontSize: 20, color: Colors.white, fontFamily: Fonts.Merienda
                      )
                  )
                ),
                Row(children: [
                  Expanded(child: Text('Expired', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w300))),
                  Text('CVV', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w300))
                ]),
               Padding(
                 padding: EdgeInsets.only(top: 8),
                 child:  Row(children: [
                   Expanded(child: Text('10 / 28', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w300, wordSpacing: 4, letterSpacing: 3))),
                   Text('123', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w300))
                 ])
               )
              ],
            )
        )
      )
    );
  }
}