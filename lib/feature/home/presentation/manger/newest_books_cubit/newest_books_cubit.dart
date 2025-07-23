import 'package:bloc/bloc.dart';
import 'package:book_app/feature/home/data/models/book_model/item.dart';
import 'package:book_app/feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewsetBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewsetBooksInitial());
  final HomeRepo homeRepo;
Future<void>fetchNewsetBooks()async{
  emit(NewsetBooksLoading());
  var result=await homeRepo.fetchNewestBooks();
  result.fold((failure){
    emit(NewsetBooksFailure(errorMessage: failure.errorMessage));
  }, (books){
    emit(NewsetBooksSuccess(books));
  });


}
}
