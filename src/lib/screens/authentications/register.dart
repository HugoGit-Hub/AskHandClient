import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:src/models/authentications/register.dart';
import 'package:src/services/authentications/authentication.dart';
import 'package:src/widgets/error_message.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final AuthenticationService _authenticationService = AuthenticationService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: TextField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                labelText: 'Age',
              ),
            ),
            const SizedBox(width: 20.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: CountryListPick(
                    onChanged: (CountryCode? countryCode) {
                      setState(() {
                        _countryController.text = countryCode!.name!;
                      });
                    },
                    initialSelection: '+33',
                    useSafeArea: false,
                  ),
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: TextField(
                    controller: _cityController,
                    decoration: const InputDecoration(
                      labelText: 'City',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                RegisterModel registerModel = RegisterModel(
                  email: _emailController.text,
                  password: _passwordController.text,
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                  age: int.parse(_ageController.text),
                  cityName: _cityController.text,
                  countryName: _countryController.text,
                );

                var result = await _authenticationService.register(registerModel: registerModel);
                if (!result) {
                  ErrorMessage.displayError('Something went wrong during registration', context);
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
