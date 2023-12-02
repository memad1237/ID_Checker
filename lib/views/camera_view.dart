import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_fyp/controllers/scan_controller.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScanController>(
          init: ScanController(),
          builder: (controller) {
            return controller.isCameraInitialized.value
                ? Column(
                    children: [
                      CameraPreview(controller.cameraController),
                      const SizedBox(height: 20),
                      // show results
                      Obx(
                        () => Text(
                          controller.detectionResult.value,
                          // Display the detection result here
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  )
                : const Center(child: Text("Loading Preview..."));
          }),
    );
  }
}
