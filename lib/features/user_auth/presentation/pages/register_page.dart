import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_registration_nxl/core/utils/validators.dart';
import '../bloc/user_auth_bloc.dart';
import '../widget/common_textfield.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();

  final emailCtrl = TextEditingController();

  final passCtrl = TextEditingController();

  final confirmCtrl = TextEditingController();

  bool _isPasswordVisible = false;

  bool _isConfirmPasswordVisible = false;

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
              gradient: LinearGradient(
                begin: AlignmentGeometry.topCenter,
                colors: [Colors.black54, Colors.black87],
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color(0xFFECECEC),
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

                          CommonTextField(
                            controller: nameCtrl,
                            validator: Validators.validateName,
                            icon: Icons.person,
                            label: "Name",
                          ),

                          const SizedBox(height: 16),

                          CommonTextField(
                            controller: emailCtrl,
                            validator: Validators.validateEmail,
                            icon: Icons.email,
                            label: "Email",
                          ),

                          const SizedBox(height: 16),
                          CommonTextField(
                            controller: passCtrl,
                            validator: Validators.validatePassword,
                            icon: Icons.lock,
                            label: "Password",
                            obscureText: !_isPasswordVisible,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          CommonTextField(
                            controller: confirmCtrl,
                            icon: Icons.lock_outline,
                            obscureText: !_isConfirmPasswordVisible,
                            label: "Confirm Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isConfirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isConfirmPasswordVisible =
                                      !_isConfirmPasswordVisible;
                                });
                              },
                            ),
                            validator: (confirmValue) =>
                                Validators.validateConfirmPassword(
                                  confirmValue,
                                  passCtrl.text,
                                ),
                          ),
                          const SizedBox(height: 24),

                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  Colors.grey,
                                ),
                              ),
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
                                  : const Text(
                                      'Register',
                                      style: TextStyle(color: Colors.black87),
                                    ),
                            ),
                          ),

                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'Back to Login',
                              style: TextStyle(color: Colors.black87),
                            ),
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
}
