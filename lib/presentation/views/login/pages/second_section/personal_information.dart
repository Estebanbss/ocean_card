import 'package:flutter/material.dart';
import 'package:ocean_card/presentation/widgets/steps.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:country_pickers/country_pickers.dart';

class PersonalInformation extends StatefulWidget {
  final ValueChanged<Map<String, dynamic>> onNext;
  const PersonalInformation({super.key, required this.onNext});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _dobDisplayController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  // PIN is handled in separate CreatePin/ConfirmPin steps
  String _fullPhone = '';
  bool _isValid = false;
  String? _selectedCountryCode;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 800),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Título y subtítulo
                Column(
                  children: [
                    StepsIndicator(totalSteps: 3, stepNow: 0),
                    const SizedBox(height: 8),
                    Text(
                      'Información personal',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Te pedimos tu información personal para verificar tu identidad',
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                        color: colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Inputs
                TextField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  onChanged: (_) => _validate(),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Apellido',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  onChanged: (_) => _validate(),
                ),
                const SizedBox(height: 10),
                // Fecha de nacimiento: usar DatePicker. Internamente guardamos
                // YYYYMMDD en `_dobController` y mostramos YYYY/MM/DD en el campo.
                TextField(
                  controller: _dobDisplayController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Fecha de nacimiento',
                    hintText: 'Selecciona tu fecha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  onTap: () async {
                    final now = DateTime.now();
                    final firstDate = DateTime(now.year - 120, 1, 1);
                    final lastDate = DateTime(
                      now.year - 18,
                      now.month,
                      now.day,
                    );
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: lastDate,
                      firstDate: firstDate,
                      lastDate: lastDate,
                    );
                    if (picked != null) {
                      final y = picked.year.toString().padLeft(4, '0');
                      final m = picked.month.toString().padLeft(2, '0');
                      final d = picked.day.toString().padLeft(2, '0');
                      // internal (no slashes) for validation/submission
                      _dobController.text = '$y$m$d';
                      // display with slashes for readability
                      _dobDisplayController.text = '$y/$m/$d';
                      _validate();
                    }
                  },
                ),
                const SizedBox(height: 10),
                IntlPhoneField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Número de teléfono',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  initialCountryCode: 'US',
                  onChanged: (phone) {
                    _fullPhone = phone.completeNumber;
                    _validate();
                  },
                  onCountryChanged: (country) {
                    // country.code is the ISO country code like 'US'
                    setState(() {
                      _selectedCountryCode = country.code;
                      _countryController.text = country.name;
                    });
                    _validate();
                  },
                ),
                const SizedBox(height: 10),
                // Country picker: constrain and allow the name to ellipsize
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  height: 56,
                  child: Row(
                    children: [
                      Expanded(
                        child: CountryPickerDropdown(
                          initialValue: _selectedCountryCode,
                          itemBuilder: (country) {
                            // Dropdown item lives in an overlay with unbounded width.
                            // Avoid Flexible/Expanded (flex children) inside that Row.
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CountryPickerUtils.getDefaultFlagImage(country),
                                const SizedBox(width: 8),
                                // Constrain the width of the country name so it
                                // ellipsizes instead of trying to flex in an
                                // unbounded environment.
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: 200,
                                  ),
                                  child: Text(
                                    country.name,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            );
                          },
                          onValuePicked: (country) {
                            setState(() {
                              _selectedCountryCode = country.isoCode;
                              _countryController.text = country.name;
                            });
                            _validate();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (_) => _validate(),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 20),

                // Botón
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: _isValid
                          ? () {
                              // Collect the data and pass upstream
                              final data = <String, dynamic>{
                                'name': _firstNameController.text.trim(),
                                'lastname': _lastNameController.text.trim(),
                                'phoneNumber': _fullPhone,
                                'country': _countryController.text.trim(),
                                'dateOfBirth': _dobController.text.trim(),
                                'email': _emailController.text.trim(),
                              };
                              widget.onNext(data);
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.all(16),
                        elevation: 2,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validate() {
    final nameOk = _firstNameController.text.trim().isNotEmpty;
    final lastOk = _lastNameController.text.trim().isNotEmpty;
    final dob = _dobController.text.trim();
    final dobOk = RegExp(r'^\d{8}$').hasMatch(dob); // YYYYMMDD
    final phoneOk = _fullPhone.isNotEmpty;
    final countryOk = _countryController.text.trim().isNotEmpty;
    final emailOk = _emailController.text.contains('@');
    final valid = nameOk && lastOk && dobOk && phoneOk && countryOk && emailOk;
    if (valid != _isValid) {
      setState(() => _isValid = valid);
    }
  }

  // country picker item builder moved inline where the widget is used

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    _countryController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
