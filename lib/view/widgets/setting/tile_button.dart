import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:udemy_shop_app/utils/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class TileButton extends StatelessWidget {
  final label;
  final IconData icon;
  final Callback onPress;

  TileButton(
      {required this.label, required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        child: InkWell(
          onTap: onPress,
          child: Center(
            child: ListTile(
              title: Text(
                '$label',
                style: const TextStyle(
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    height: 2.0),
              ),
              leading: Icon(
                icon,
                color: mainColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

