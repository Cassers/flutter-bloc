import 'package:blocs_app/config/config.dart';
import 'package:get_it/get_it.dart';
import 'blocs.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit(){
  getIt.registerLazySingleton(() => UsernameCubit());
  getIt.registerLazySingleton(() => RouterSimpleCubit());
  getIt.registerLazySingleton(() => CounterCubit());
  getIt.registerLazySingleton(() => ThemeCubit());
  getIt.registerLazySingleton(() => GuestsBloc());
  getIt.registerLazySingleton(() => PokemonBloc(fetchPokemon: PokemonInformation.getPokemonName));
  getIt.registerLazySingleton(() => HistoricLocationBloc());
  getIt.registerLazySingleton(() => GeolocationCubit(
    onNewUserLocationCallback: getIt<HistoricLocationBloc>().onNewUserLocation,
  )..watchUserLocation());
}