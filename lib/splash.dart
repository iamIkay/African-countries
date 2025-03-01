import 'package:african_countries/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    handleRoute();
  }

  void handleRoute() async {
    await Future.delayed(const Duration(milliseconds: 1500), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 150.0,
                left: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("African Countries",
                        style: TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    Text(
                        "Explore the African continent\nLearn about its countries",
                        style:
                            TextStyle(fontSize: 18.0, color: Colors.grey[400])),
                  ],
                )),
            const Positioned(
              bottom: 230.0,
              child: FlagCircle(
                "assets/flags/ng.png",
                size: 140.0,
              ),
            ),
            const Positioned(
                bottom: 380.0,
                right: 30.0,
                child: FlagCircle(
                  "assets/flags/zw.png",
                  size: 90.0,
                )),
            const Positioned(
                bottom: 320.0,
                left: 30.0,
                child: FlagCircle(
                  "assets/flags/za.png",
                  size: 110.0,
                )),
            const Positioned(
                bottom: 120.0,
                left: 40.0,
                child: FlagCircle(
                  "assets/flags/gh.png",
                  size: 110.0,
                )),
            const Positioned(
                bottom: 100.0,
                right: 50.0,
                child: FlagCircle(
                  "assets/flags/eg.png",
                )),
            const Positioned(
                bottom: 250.0,
                right: -60.0,
                child: FlagCircle(
                  "assets/flags/ke.png",
                )),
            const Positioned(
                bottom: 220.0,
                left: -50.0,
                child: FlagCircle(
                  "assets/flags/ma.png",
                  size: 90,
                )),
            const Positioned(
                bottom: 40.0,
                right: -60.0,
                child: FlagCircle(
                  "assets/flags/ao.png",
                )),
            const Positioned(
                bottom: 40.0,
                left: -50.0,
                child: FlagCircle(
                  "assets/flags/dz.png",
                  size: 90,
                )),
          ],
        ),
      ),
    );
  }
}

class FlagCircle extends StatelessWidget {
  final String flag;
  final double? size;
  const FlagCircle(this.flag, {this.size = 100.0, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(flag))),
    );
  }
}
