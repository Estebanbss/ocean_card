import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocean_card/core/configuration/tema/tema_cubit.dart';

import 'pages/second_section/four_digit_code.dart';
import 'pages/second_section/personal_information.dart';
import 'pages/second_section/home_adress.dart';
import 'pages/second_section/create_pin.dart';
import 'pages/first_section/login.dart';
import 'pages/first_section/login_pin.dart';
import 'steps/steps_indicator.dart';
import 'steps/login_intro_steps.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final PageController _pageController = PageController();
  int _currentStep = 0;
  int _introStep = 0;

  void _goToPage(int index) {
    if ((index - _pageController.page!.round()).abs() > 1) {
      _pageController.jumpToPage(index);
    } else {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<TemaCubit>().lightTheme();
    _pageController.addListener(() {
      final page = _pageController.page ?? 0.0;
      final round = page.round().clamp(0, 2);
      if (_currentStep != round) {
        setState(() {
          _currentStep = round;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 64, 20, 20),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 400,
                            maxHeight: 800,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: LoginIntroSteps(
                                  onStepChanged: (i) =>
                                      setState(() => _introStep = i),
                                ),
                              ),

                              Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () => _goToPage(1),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: colorScheme.primary,
                                      foregroundColor: Colors.white,
                                      minimumSize: const Size(
                                        double.infinity,
                                        50,
                                      ),
                                      elevation: 2,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(100),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Get Started',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  OutlinedButton(
                                    onPressed: () => _goToPage(6),
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                        color: colorScheme.primary,
                                      ),
                                      foregroundColor: colorScheme.primary,
                                      minimumSize: const Size(
                                        double.infinity,
                                        50,
                                      ),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(100),
                                        ),
                                      ),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    child: Text(
                                      'Sign in',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Página 2: FourDigitCode
                    FourDigitCode(
                      onNext: () => _goToPage(3),
                      onSignIn: () => _goToPage(6),
                    ),
                    // Página 3: PersonalInformation
                    PersonalInformation(onNext: () => _goToPage(4)),
                    // Página 4: HomeAdress
                    HomeAdress(onNext: () => _goToPage(5)),
                    // Página 5: CreatePin
                    const CreatePin(),
                    // Página 6: Login
                    Login(onNext: () => _goToPage(7)),
                    // Página 7: LoginPin
                    const LoginPin(),
                  ],
                ),

                // Fixed thin ticks at top
                Positioned(
                  top: 8,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: StepsIndicator(
                      currentIndex: _introStep,
                      primaryColor: colorScheme.primary,
                      onSurface: colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
