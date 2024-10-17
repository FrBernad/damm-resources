// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// ignore: missing_provider_scope
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FormBuilder Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  RegistrationFormState createState() => RegistrationFormState();
}

class RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _showAdditionalFields = false;

  void _onSubmit() {
    if (_formKey.currentState!.saveAndValidate()) {
      // In a real app, you would handle the form submission here
      //
      print(_formKey.currentState!.value);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration Successful!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration Form')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'name',
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.maxLength(70),
                ]),
              ),
              const SizedBox(height: 16),
              // Text field for email with ValueTransformer
              FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(labelText: 'Email'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
                // ValueTransformer to convert email to lowercase
                valueTransformer: (String? value) => value?.toLowerCase(),
              ),
              const SizedBox(height: 16),
              FormBuilderDropdown<String>(
                name: 'gender',
                decoration: const InputDecoration(labelText: 'Gender'),
                items: ['Male', 'Female', 'Other']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                validator: FormBuilderValidators.required(),
                onChanged: (value) {
                  setState(() {
                    _showAdditionalFields = value == 'Other';
                  });
                },
              ),
              if (_showAdditionalFields) ...[
                const SizedBox(height: 16),
                FormBuilderTextField(
                  name: 'gender_details',
                  decoration:
                      const InputDecoration(labelText: 'Please specify'),
                  validator: FormBuilderValidators.required(),
                ),
              ],
              const SizedBox(height: 16),
              FormBuilderDateTimePicker(
                name: 'dob',
                inputType: InputType.date,
                decoration: const InputDecoration(labelText: 'Date of Birth'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  (val) {
                    if (val != null && val.isAfter(DateTime.now())) {
                      return 'Date of birth cannot be in the future';
                    }
                    return null;
                  },
                ]),
              ),
              const SizedBox(height: 16),
              // Custom Skill Level Field
              FormBuilderField<double>(
                name: 'skill_level',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.min(0),
                  FormBuilderValidators.max(100),
                ]),
                builder: (FormFieldState<double> field) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Skill Level',
                      errorText: field.errorText,
                    ),
                    child: Column(
                      children: [
                        Slider(
                          value: field.value ?? 0,
                          min: 0,
                          max: 100,
                          divisions: 20,
                          label: '${field.value?.round() ?? 0}',
                          onChanged: (value) {
                            field.didChange(value);
                          },
                        ),
                        Text(
                          'Current Level: ${field.value?.round() ?? 0}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              FormBuilderCheckbox(
                name: 'terms',
                title: const Text('I agree to the terms and conditions'),
                validator: FormBuilderValidators.equal(
                  true,
                  errorText: 'You must accept terms and conditions',
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _onSubmit,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
