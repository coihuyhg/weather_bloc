part of 'setting_cubit.dart';

// ignore: must_be_immutable
class SettingState extends Equatable {
  LoadStatus? loadStatus;
  UnitResponse? result;

  SettingState({this.loadStatus, this.result});

  SettingState copyWith({
    LoadStatus? loadStatus,
    UnitResponse? result,
  }) {
    return SettingState(
        loadStatus: loadStatus ?? this.loadStatus,
        result: result ?? this.result);
  }

  List<Object?> get props => [
        loadStatus,
        result,
      ];
}
