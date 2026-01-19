import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_registration_nxl/core/utils/validators.dart';

import '../bloc/user_auth_bloc.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserAuthBloc, UserAuthState>(
        listener: (context, state) {
          if (state is UserAuthSuccess) {
            Navigator.pushReplacementNamed(context, '/welcome');
          }

          if (state is UserAuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(begin: AlignmentGeometry.topCenter,
                colors: [Colors.black54, Colors.black87],
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),color: Color(0xFFECECEC),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Text(
                            'Create Account',
                            style: TextStyle(
                              // color: Colors.grey,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 24),

                          TextFormField(
                            controller: nameCtrl,
                            validator: (nameValidation) =>
                            nameValidation == null || nameValidation.isEmpty ? 'Name required' : null,
                            decoration: _input('Name', Icons.person),
                            // style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 16),

                          TextFormField(
                            controller: emailCtrl,
                            validator: (emailValidation) {
                              if (emailValidation == null || emailValidation.isEmpty) {
                                return 'Email required';
                              }
                              if (!emailValidation.contains('@')) {
                                return 'Invalid email';
                              }
                              return null;
                            },
                            decoration: _input('Email', Icons.email),
                            // style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 16),

                          TextFormField(
                            controller: passCtrl,
                            obscureText: true,
                            validator: Validators.validatePassword,
                            decoration: _input('Password', Icons.lock),
                            // style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 16),

                          TextFormField(
                            controller: confirmCtrl,
                            obscureText: true,
                            validator: (confirmValue) {
                              if (confirmValue != passCtrl.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            decoration: _input(
                              'Confirm Password',
                              Icons.lock_outline,
                            ),
                            // style: TextStyle(color: Colors.white),
                          ),

                          const SizedBox(height: 24),

                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(
                                Colors.grey
                              )),
                              onPressed: state is UserAuthLoading
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<UserAuthBloc>().add(
                                          RegisterRequested(
                                            emailCtrl.text.trim(),
                                            passCtrl.text.trim(),
                                          ),
                                        );
                                      }
                                    },
                              child: state is UserAuthLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text('Register',style: TextStyle(color: Colors.black87),),
                            ),
                          ),

                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Back to Login',style: TextStyle(color: Colors.black87),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  InputDecoration _input(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
