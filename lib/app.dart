import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offlineapp/config/theme/app_theme.dart';
import 'package:offlineapp/core/services/di.dart';
import 'package:offlineapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:offlineapp/features/home/presentation/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home:BlocProvider(
        create: (context)=>di<HomeBloc>()..add(const HomeCallProductsEvent()),
        child: const HomeScreen(),
      ),
    );
  }
}