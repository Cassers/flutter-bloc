import 'package:bloc/bloc.dart';

class UsernameCubit extends Cubit<String>{
  UsernameCubit() : super('no-username'){
    print('UsernameCubit created');
  }

  void setUsername(String username){
    emit(username);
  }
}