import 'package:flutter/material.dart';
import 'package:flutter_coffemaker/models/onboard_model.dart';
import 'package:flutter_coffemaker/core/consts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late final PageController _pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          PageView.builder(
              itemCount: onBoards.length,
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        onBoards[index].onboardingImage,
                        width: size.width,
                        height: 650,
                      ),
                    )
                  ],
                );
              }),
          Positioned(
            left: 30,
            right: 30,
            top: 70,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: onBoards.length,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey.withOpacity(0.5),
                        activeDotColor: Colors.orange,
                        spacing: 5,
                        dotWidth: 15,
                        dotHeight: 5,
                        expansionFactor: 2,
                        radius: 10,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomePage(),
                            ),
                            (route) => false);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Text(
                  onBoards[currentPage].title,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  onBoards[currentPage].subTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
