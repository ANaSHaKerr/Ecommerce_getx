import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:udemy_shop_app/utils/theme.dart';

class DefaultButton extends StatelessWidget {
  final String? btnText;
  final Callback? onPressed;
  const DefaultButton({
    Key? key, this.btnText, this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)),
        color: mainColor,
        textColor: Colors.white,
        highlightColor: Colors.transparent,
        onPressed: onPressed,
        child: Text(btnText!.toUpperCase(),
        style: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}