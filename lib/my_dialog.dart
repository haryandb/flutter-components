import 'package:components/helpers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyDialog {
  static logout(BuildContext context, void Function()? onPress) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Informasi'),
          content: const Text('Apakah Anda yakin ingin logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: onPress,
              child: const Text(
                'Ya, Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  static showPeringantanDialog(BuildContext context, String pesan) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Peringatan'),
          content: Text(pesan),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static textWrappedBottomSheet(
      BuildContext context, String judul, String text) {
    return Text.rich(
      TextSpan(
        text: "${Helpers.wrapText(text)} ",
        // style: const TextStyle(fontWeight: FontWeight.bold),
        children: [
          if (Helpers.wrapText(text).length >= 100)
            TextSpan(
              style: const TextStyle(color: Colors.blue),
              text: "... Selengkapnya",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: ListTile(
                          title: Text(judul),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: SelectableText(
                              text,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
            ),
        ],
      ),
    );
  }
}
