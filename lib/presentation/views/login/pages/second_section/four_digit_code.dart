import 'package:flutter/material.dart';
import 'package:ocean_card/presentation/widgets/steps.dart';

class FourDigitCode extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback? onSignIn;
  const FourDigitCode({super.key, required this.onNext, this.onSignIn});

  @override
  State<FourDigitCode> createState() => _FourDigitCodeState();
}

class _FourDigitCodeState extends State<FourDigitCode> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(int idx, String value) {
    if (value.length == 1 && idx < 3) {
      _focusNodes[idx + 1].requestFocus();
    }
    if (value.isEmpty && idx > 0) {
      _focusNodes[idx - 1].requestFocus();
    }
    setState(() {});
  }

  String get code => _controllers.map((c) => c.text).join();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 800),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Steps y título/subtítulo
              Column(
                children: [
                  StepsIndicator(totalSteps: 5, stepNow: 1),
                  const SizedBox(height: 24),
                  Column(
                    children: [
                      Text(
                        'Enter 4-digit code',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 32,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "We've send the code to ***1234",
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 16,
                          color: colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Multi input para el código
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (idx) {
                  return Container(
                    width: 48,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    child: TextField(
                      controller: _controllers[idx],
                      focusNode: _focusNodes[idx],
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                      decoration: const InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      onChanged: (value) => _onChanged(idx, value),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 32),

              // Botón y texto de "Already have an account? Sign in"
              Column(
                children: [
                  ElevatedButton(
                    onPressed: code.length == 4 ? widget.onNext : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      elevation: 2,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                    child: const Text(
                      'Get started',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: widget.onSignIn,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign in',
                              style: TextStyle(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
