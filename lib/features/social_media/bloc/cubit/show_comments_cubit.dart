import 'package:flutter_bloc/flutter_bloc.dart';

class ShowCommentsCubit extends Cubit<bool> {
  ShowCommentsCubit() : super(false);

  void showComments() => emit(!state);
}
