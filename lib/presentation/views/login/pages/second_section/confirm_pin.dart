import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef PinConfirmed = void Function(String pin);
typedef PinFailed = void Function();

class ConfirmPin extends StatefulWidget {
  final String initialPin;
  final PinConfirmed onConfirmed;
  final PinFailed onFailed;
  const ConfirmPin({
    super.key,
    required this.initialPin,
    required this.onConfirmed,
    required this.onFailed,
  });

  @override
  State<ConfirmPin> createState() => _ConfirmPinState();
}

class _ConfirmPinState extends State<ConfirmPin> {
  final TextEditingController _confirmController = TextEditingController();
  bool _isValid = false;

  void _onChanged(String _) {
    final ok = RegExp(r'^\d{4}$').hasMatch(_confirmController.text);
    if (ok != _isValid) setState(() => _isValid = ok);
  }

  @override
  void dispose() {
    _confirmController.dispose();
    super.dispose();
  }

  void _verify() {
    if (_confirmController.text == widget.initialPin) {
      widget.onConfirmed(_confirmController.text);
    } else {
      widget.onFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Confirmar PIN',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Text(
            'Introduce el mismo PIN para confirmar. Si no coincide, volverás a crear el PIN.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _confirmController,
            decoration: const InputDecoration(
              labelText: 'Confirmar PIN',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            maxLength: 4,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            obscureText: true,
            onChanged: _onChanged,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _isValid ? _verify : null,
            child: const Text('Verificar'),
          ),
        ],
      ),
    );
  }
}
