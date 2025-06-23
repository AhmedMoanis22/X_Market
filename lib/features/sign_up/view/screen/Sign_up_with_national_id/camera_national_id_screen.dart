import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:x_market/core/utilits/widgets/custom_appbar.dart';

import '../../../../../core/theme/colors.dart';

class NationalIdCameraScreen extends StatefulWidget {
  const NationalIdCameraScreen({super.key});

  @override
  State<NationalIdCameraScreen> createState() => _NationalIdCameraScreenState();
}

class _NationalIdCameraScreenState extends State<NationalIdCameraScreen> {
  CameraController? _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final backCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.back,
    );

    _controller = CameraController(
      backCamera,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller!.initialize();
    await _initializeControllerFuture;

    // ⛔ قفل الفلاش
    await _controller!.setFlashMode(FlashMode.off);

    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  File? _capturedImage;

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller!.takePicture();
      setState(() {
        _capturedImage = File(image.path);
      });
      print("📸 صورة محفوظة في: ${image.path}");
    } catch (e) {
      print('❌ خطأ أثناء التصوير: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'صورة بطاقة الرقم القومي',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'IBMPLEXSANSARABICBold',
              ),
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'اتأكد إن الصورة بالكامل داخل المستطيل المحدد، وإن الصورة واضحة مش ضبابية وكل المعلومات عليها واضحة.',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'IBMPLEXSANSARABICRegular',
                  color: AppColors.gray),
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 2.5,
                  child: _capturedImage != null
                      ? Stack(
                          children: [
                            Image.file(
                              _capturedImage!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: IconButton(
                                icon: const Icon(Icons.restart_alt,
                                    size: 40, color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    _capturedImage = null;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      : _controller == null
                          ? const Center(child: CircularProgressIndicator())
                          : FutureBuilder(
                              future: _initializeControllerFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return CameraPreview(_controller!);
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (_capturedImage == null)
            IconButton(
              icon: const Icon(Icons.camera_alt, size: 40),
              onPressed: _takePicture,
            ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
