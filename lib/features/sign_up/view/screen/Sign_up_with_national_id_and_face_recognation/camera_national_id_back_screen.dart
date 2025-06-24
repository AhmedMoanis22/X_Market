import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:x_market/core/utilits/widgets/custom_appbar.dart';

import '../../../../../core/routing/app_routes_name.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/utilits/widgets/custom_head_text.dart';
import '../../../../../core/utilits/widgets/custom_sub_head_text.dart';
import '../../../../../core/utilits/widgets/custom_text_button.dart';

class NationalIdBackCameraScreen extends StatefulWidget {
  const NationalIdBackCameraScreen({super.key});

  @override
  State<NationalIdBackCameraScreen> createState() =>
      _NationalIdCameraScreenState();
}

class _NationalIdCameraScreenState extends State<NationalIdBackCameraScreen> {
  CameraController? _controller;
  late Future<void> _initializeControllerFuture;
  File? _capturedImage;

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
    _controller = CameraController(backCamera, ResolutionPreset.high);
    _initializeControllerFuture = _controller!.initialize();
    await _initializeControllerFuture;
    await _controller!.setFlashMode(FlashMode.off);
    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller!.takePicture();
      setState(() {
        _capturedImage = File(image.path);
      });
    } catch (e) {
      print('❌ خطأ أثناء التصوير: $e');
    }
  }

  void _resetPicture() {
    setState(() {
      _capturedImage = null;
    });
  }

  void _acceptPicture() {
    Get.toNamed(AppRoutesName.face_recognation_screen);
    Fluttertoast.showToast(
      msg: 'تم قبول الصورة ',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.primaryGreen,
    );
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
            child: CustomHeadText(
              text: 'صورة بطاقة الرقم القومي',
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomSubHeadText(
              text:
                  'محتاجين صورة البطاقة الشخصية عشان تثبت إنك عايش في مصر وعلشان نقدر نأكد هويتك، بياناتك بتتراجع بأمان.',
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              height: 30,
              color: AppColors.lightblue,
              child: const Text(
                'الخلفية',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'IBMPLEXSANSARABICRegular',
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: _capturedImage != null
                      ? Image.file(
                          _capturedImage!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
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

          // الزرار حسب الحالة
          if (_capturedImage == null) ...[
            GestureDetector(
              onTap: _takePicture,
              child: SvgPicture.asset(
                'assets/icons/group.svg',
                color: Colors.grey,
              ),
            ),
          ] else ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextButton(
                  onPressed: _acceptPicture,
                  text: 'مقبولة',
                  width: 150,
                ),
                const SizedBox(width: 16),
                CustomTextButton(
                  onPressed: _resetPicture,
                  text: 'صورها تاني',
                  width: 150,
                  buttonColor: Colors.white,
                  textColor: AppColors.primaryGreen,
                ),
              ],
            ),
          ],

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
