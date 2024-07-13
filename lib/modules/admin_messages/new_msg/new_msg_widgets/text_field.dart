import 'package:flutter/material.dart';

class MsgTextField extends StatelessWidget {
  MsgTextField(
      {@required this.hitText,
      @required this.boxHeight,
      @required this.tobeDone,
      @required this.onComplete});
  String? hitText;
  double? boxHeight;
  VoidCallback? tobeDone;
  VoidCallback? onComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: const EdgeInsets.all(10),
      height: boxHeight,
      child: TextFormField(
        onEditingComplete: onComplete,
        onTap: tobeDone,
        minLines: 1,
        maxLines: 10,
        decoration: InputDecoration(
          hintText: hitText,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ),
    );
  }
}
