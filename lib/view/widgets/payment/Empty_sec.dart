import 'package:flutter/material.dart';


class EmptySection extends StatelessWidget {
  final String? emptyImg, emptyMsg;
  const EmptySection({
    Key? key,
    this.emptyImg,
    this.emptyMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(emptyImg!),
            height: 150.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              emptyMsg!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26
              ),
            ),
          ),
        ],
      ),
    );
  }
}