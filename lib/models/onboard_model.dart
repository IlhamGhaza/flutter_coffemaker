class OnBoardModel {
  final String onboardingImage, title, subTitle;

  OnBoardModel({
    required this.onboardingImage,
    required this.title,
    required this.subTitle,
  });
}

List<OnBoardModel> onBoards = [
  OnBoardModel(
    onboardingImage: 'assets/images/onboard1.png',
    title: 'ColdnBrew',
    subTitle: 'Buy the best and premium\ncoffee makers',
  ),
  OnBoardModel(
    onboardingImage: 'assets/images/onbording33.png',
    title: 'Best Quality',
    subTitle: 'Premium Quality that makes\ncoffeemore elegant and\ndurable',
  ),
  OnBoardModel(
    onboardingImage: 'assets/images/onbording11.png',
    title: 'Stylish Design',
    subTitle:
        'A unique and different style from\nother teapots gives more\nluxurious',
  ),
];
