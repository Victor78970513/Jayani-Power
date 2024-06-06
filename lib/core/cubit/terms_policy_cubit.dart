import 'package:flutter_bloc/flutter_bloc.dart';

class TermsPolicyCubit extends Cubit<bool> {
  TermsPolicyCubit() : super(false);

  void aceptTermsAndPolicy() => emit(true);

  void declineTermsAndPolicy() => emit(false);
}
