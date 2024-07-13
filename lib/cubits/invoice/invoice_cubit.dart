import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/invoice.dart';

part 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit() : super(InvoiceInitial());

  static InvoiceCubit get(context) => BlocProvider.of(context);

  void getAsce(bool Asc) {
    if (Asc == true) {
      emit(Mychoice());
    } else {
      emit(NotmyChoice());
    }
  }

  void getChoice(bool myChoice) {
    if (myChoice == true) {
      emit(Mychoice());
    } else {
      emit(NotmyChoice());
    }
  }
}
