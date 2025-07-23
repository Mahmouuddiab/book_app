import 'package:bloc/bloc.dart';
import 'package:book_app/feature/home/data/models/book_model/item.dart';
import 'package:book_app/feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  Future<void>fetchSimilarBooks({required String category})async
  {
    emit(SimilarBooksLoading());

var data= await homeRepo.fetchSimilarBooks(category: category);
data.fold((failure){
  emit(SimilarBooksFailure(errorMessage: failure.errorMessage));
}, (books){
  emit(SimilarBooksSuccess(books));
})  ;
  }}
