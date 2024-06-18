part of 'get_new_user_data_cubit.dart';

@immutable
sealed class GetNewUserDataState {}

final class GetNewUserDataInitial extends GetNewUserDataState {}

final class GetNewUserDataLoading extends GetNewUserDataState {}

final class GetNewUserDataSucess extends GetNewUserDataState {}

final class GetNewUserDataError extends GetNewUserDataState {}
