import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs.dart';



class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //final geolocationCubit = context.watch<GeolocationCubit>().state.location;
    final historicLocation = context.watch<HistoricLocationBloc>();
    final locationState = historicLocation.state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicaciones: ${locationState.numberOfLocations}'),
      ),
      body: ListView.builder(
        itemCount: locationState.numberOfLocations,
        itemBuilder: (context, index) {
          final location = locationState.locations[index];
          final (latitude, longitude) = location;
          return ListTile(
            title: Text('Lat: $latitude, Long: $longitude'),
          );
        },
      ),
    );
  }
}