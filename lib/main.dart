import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'features/user_auth/bloc/user_auth_bloc.dart';
import 'features/user_auth/data/auth_repository.dart';
import 'features/user_auth/data/firebase_auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    BlocProvider(
      create: (_) => UserAuthBloc(
        AuthRepository(FirebaseAuthService()),
      ),
      child: const MyApp(),
    ),
  );
}



