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

  static showPeringantanDialog(
    BuildContext context,
    String pesan,
    void Function()? onPressOk,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Peringatan'),
          content: Text(pesan),
          actions: <Widget>[
            TextButton(
              onPressed: onPressOk,
              child: const Text('OK'),
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
        style: const TextStyle(
          fontSize: 16,
        ),
        text: "${wrapText(text)}",
        // style: const TextStyle(fontWeight: FontWeight.bold),
        children: [
          if (wrapText(text).length >= 100)
            TextSpan(
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 16,
              ),
              text: "... Selengkapnya",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: ListTile(
                          title: Text(
                            judul,
                            style: const TextStyle(fontSize: 20),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
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

  static String wrapText(String? deskripsi) {
    if (deskripsi == null) {
      return "";
    }
    if (deskripsi.length <= 100) {
      return deskripsi;
    }
    return deskripsi.substring(0, 100);
  }
}
