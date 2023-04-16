import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const HomeScreen({required this.cameras, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CameraController cameraCtrl;
  @override
  void initState() {
    cameraCtrl = CameraController(
      widget.cameras[1],
      ResolutionPreset.veryHigh,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await cameraCtrl.initialize();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {},
          child: Stack(
            children: [
              SizedBox(
                width: 250,
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CameraPreview(cameraCtrl),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  width: 250,
                  height: 80,
                  child: Center(
                    child: Text(
                      'Flutter Dicas',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
