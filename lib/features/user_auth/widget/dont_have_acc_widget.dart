import 'package:flutter/cupertino.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, '/register'),
          child: const Text(
            'Register',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              // color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
