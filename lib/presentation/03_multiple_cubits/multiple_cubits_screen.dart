import 'package:blocs_app/config/helpers/random_generator.dart';
import 'package:blocs_app/presentation/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MultipleCubitScreen extends StatelessWidget {
  const MultipleCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final counterCubit = context.watch<CounterCubit>();
    final themeCubit = context.watch<ThemeCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Cubits'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1,),

            IconButton(
              icon: 
                themeCubit.state.isDarkMode ? 
                  const Icon( Icons.light_mode_outlined, size: 100 ) :
                  const Icon( Icons.dark_mode_outlined, size: 100 ),
              onPressed: () {
                themeCubit.toggleTheme();
              },
            ),

            Text(context.watch<UsernameCubit>().state, style: const TextStyle(fontSize: 25 )),

            TextButton.icon(
              icon: const Icon( Icons.add, size: 50,),
              label: Text('${counterCubit.state}', style: const TextStyle(fontSize: 100)),
              onPressed: () {
                counterCubit.increment();
              },
            ),
            
            const Spacer( flex: 2 ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon( Icons.refresh_rounded ),
        onPressed: () {
          context.read<UsernameCubit>().setUsername(
            RandomGenerator.getRandomName()
          );
        },
      ),
    );
  }
}