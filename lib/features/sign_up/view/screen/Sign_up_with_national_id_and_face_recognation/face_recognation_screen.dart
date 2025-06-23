import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:x_market/core/utilits/widgets/custom_appbar.dart';

import '../../../../../core/routing/app_routes_name.dart';
import '../../../../../core/theme/colors.dart';
import '../../../bussiness_logic/progress_indecator.dart';

class FaceRecognationScreen extends StatefulWidget {
  const FaceRecognationScreen({super.key});

  @override
  State<FaceRecognationScreen> createState() => _NationalIdCameraScreenState();
}

class _NationalIdCameraScreenState extends State<FaceRecognationScreen> {
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
    Get.toNamed(AppRoutesName.job_status_screen);
    context.read<ProgressIndicatorCubit>().nextStep();
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'صورة سيلفي',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'IBMPLEXSANSARABICBold',
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'محتاجين صورة البطاقة الشخصية عشان تثبت إنك عايش في مصر وعلشان نقدر نأكد هويتك، بياناتك بتتراجع بأمان.',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'IBMPLEXSANSARABICRegular',
                  color: AppColors.gray),
              textAlign: TextAlign.right,
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
                ElevatedButton(
                  onPressed: _acceptPicture,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                  ),
                  child: const Text(
                    'مقبولة',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'IBMPLEXSANSARABICBold'),
                  ),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: _resetPicture,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primaryGreen),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                  ),
                  child: const Text(
                    'صورها تاني',
                    style: TextStyle(
                        color: AppColors.primaryGreen,
                        fontSize: 18,
                        fontFamily: 'IBMPLEXSANSARABICBold'),
                  ),
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
