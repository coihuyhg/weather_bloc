part of 'setting_cubit.dart';

class SettingState extends Equatable {
  LoadStatus? loadStatus;
  UnitResponse? result;

  SettingState({this.loadStatus, this.result});

  SettingState copyWith({
    LoadStatus? loadStatus,
    UnitResponse? unitResponse,
  }) {
    return SettingState(
        loadStatus: loadStatus ?? this.loadStatus,
        result: unitResponse ?? this.result);
  }

  List<Object?> get props => [
        loadStatus,
        result,
      ];
}
