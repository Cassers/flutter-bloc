import 'package:blocs_app/presentation/03_multiple_cubits/cubit/theme_cubit.dart';
import 'package:blocs_app/presentation/blocs.dart';
import 'package:flutter/material.dart';
import 'package:blocs_app/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsernameCubit(), lazy: true,),
        BlocProvider(create: (context) => RouterSimpleCubit(),),
        BlocProvider(create: (context) => CounterCubit(),),
        BlocProvider(create: (context) => ThemeCubit(),),
      ],
      child: const MyApp(),
    );
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final appRouter = context.watch<RouterSimpleCubit>().state;
    final theme = context.watch<ThemeCubit>().state;

    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme( isDarkmode: theme.isDarkMode ).getTheme(),
    );
  }
}
