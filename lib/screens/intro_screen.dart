import 'package:flutter/material.dart';
import 'login_page.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final List<Map<String, String>> _introData = [
    {
      'image': 'assets/StyleGen.png',
      'title': 'Combine faceswap and outfit changing',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    },
    {
      'image': 'assets/StyleGen.png',
      'title': 'Enjoy Real-time Processing',
      'description':
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    },
    {
      'image': 'assets/StyleGen.png',
      'title': 'Share Your Creations',
      'description':
          'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    },
  ];

  void _nextPage() {
    if (_currentIndex < _introData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }
  }

  void _skipIntro() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _introData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        _introData[index]['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            _introData[index]['title']!,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _introData[index]['description']!,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _introData.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3.0),
                      width: _currentIndex == index ? 32.0 : 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: _currentIndex == index
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: _skipIntro,
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors
                              .lightBlue, // Thay bằng Theme.of(context).colorScheme.secondary
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.lightBlue.withOpacity(
                            0.1), // Thay bằng Theme.of(context).colorScheme.secondary.withOpacity(0.1)
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _nextPage,
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors
                              .white, // Thay bằng Theme.of(context).textTheme.labelLarge.color
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
