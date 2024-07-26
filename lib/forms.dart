import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PilihFileWidget extends StatefulWidget {
  void Function(XFile? value)? onSelectedFileChanged;
  Icon? icon;
  final Text text;
  final String? errorMessage; // Tambahkan properti errorMessage yang boleh null

  PilihFileWidget({
    Key? key,
    this.onSelectedFileChanged,
    this.icon,
    required this.text,
    this.errorMessage, // Tambahkan ke konstruktor
  }) : super(key: key);

  @override
  State<PilihFileWidget> createState() => _PilihFileWidgetState();
}

class _PilihFileWidgetState extends State<PilihFileWidget> {
  String selectedFile = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () async {
            final ImagePicker _picker = ImagePicker();
            var image = await _picker.pickImage(
              source: ImageSource.gallery,
              imageQuality: 60,
              preferredCameraDevice: CameraDevice.front,
            );

            if (image != null) {
              setState(() {
                selectedFile = image.path.split("/").last;
              });
            }

            if (widget.onSelectedFileChanged != null) {
              widget.onSelectedFileChanged!(image);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.cloud_upload,
                color: Colors.white,
              ),
              const SizedBox(width: 9),
              widget.text,
            ],
          ),
        ),
        const SizedBox(height: 3),
        Text("Dipilih: $selectedFile"),
        if (widget.errorMessage != null)
          Text(
            widget.errorMessage!,
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}
