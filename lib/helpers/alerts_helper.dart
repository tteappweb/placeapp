import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';

void success(
  BuildContext context,
  String title,
  String message, 
  bool barrierDismissible,
  {
  Function f = null,
}) {
  CoolAlert.show(
    barrierDismissible: barrierDismissible,
    context: context,
    type: CoolAlertType.success,
    title: title,
    text: message,
    onConfirmBtnTap: f,
  );
}

void error(BuildContext context, String title, String message) {
  CoolAlert.show(
    context: context,
    type: CoolAlertType.error,
    title: title,
    text: message,
  );
}

showAlert(BuildContext context, String title, String subtitle) {
  if (Platform.isAndroid) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(subtitle),
        actions: <Widget>[
          MaterialButton(
              child: Text('Ok'),
              elevation: 5,
              textColor: Colors.blue,
              onPressed: () => Navigator.pop(context))
        ],
      ),
    );
  }

  showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(subtitle),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('Ok'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ));
}
