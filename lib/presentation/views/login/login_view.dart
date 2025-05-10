import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ocean_card/core/configuration/tema/tema_cubit.dart';

import 'pages/second_section/started.dart';
import 'pages/second_section/four_digit_code.dart';
import 'pages/second_section/personal_information.dart';
import 'pages/second_section/home_adress.dart';
import 'pages/second_section/create_pin.dart';
import 'pages/first_section/login.dart';
import 'pages/first_section/login_pin.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final PageController _pageController = PageController();

  void _goToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<TemaCubit>().lightTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // Página 0: Botones iniciales
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Column(
                        spacing: 40,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset('logo.svg', height: 30),
                          SvgPicture.asset('section-cards.svg', height: 300),
                          Column(
                            spacing: 10,
                            children: [
                              ElevatedButton(
                                onPressed: () => _goToPage(1),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      colorScheme.secondaryContainer,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(double.infinity, 50),
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              OutlinedButton(
                                onPressed: () => _goToPage(6),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: colorScheme.secondaryContainer,
                                  ),
                                  foregroundColor:
                                      colorScheme.secondaryContainer,
                                  minimumSize: const Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
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
                                    color: colorScheme.secondaryContainer,
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
                // Página 1: Started
                Started(onNext: () => _goToPage(2)),
                // Página 2: FourDigitCode
                FourDigitCode(onNext: () => _goToPage(3)),
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
