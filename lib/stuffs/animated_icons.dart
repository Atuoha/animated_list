import 'package:flutter/material.dart';

class AnimatedIconsImpl extends StatefulWidget {
  const AnimatedIconsImpl({Key? key}) : super(key: key);

  @override
  State<AnimatedIconsImpl> createState() => _AnimatedIconsImplState();
}

class _AnimatedIconsImplState extends State<AnimatedIconsImpl>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => triggerAction(),
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            size: 150,
            progress: controller!,
          ),
        ),
      ),
    );
  }

  triggerAction() {
    if (isPlaying) {
      controller!.forward();
    } else {
      controller!.reverse();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }
}
