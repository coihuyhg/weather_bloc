import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/model/load_status.dart';
import 'package:weather_bloc/model/unit.dart';
part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  UnitResponse unitResponse;

  SettingCubit(this.unitResponse) : super(SettingState());

}