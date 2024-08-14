import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:offlineapp/core/resources/data_state.dart';
import 'package:offlineapp/features/home/data/model/products_model.dart';
import 'package:offlineapp/features/home/presentation/bloc/home_status.dart';
import 'package:offlineapp/features/home/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;
  HomeBloc(this._homeRepository)
      : super(HomeState(homeProductsStatus: HomeProductsStatusInit())) {
    on<HomeCallProductsEvent>(_homeCallProductsEventHandler);
  }

  FutureOr<void> _homeCallProductsEventHandler(
      HomeCallProductsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(homeProductsStatus: HomeProductsStatusLoading()));
    final DataState dataState = await _homeRepository.fetchProducts();
    if (dataState is DataSuccess) {
      emit(state.copyWith(
          homeProductsStatus:
              HomeProductsStatusCompleted(dataState.data as ProductsModel)));
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(homeProductsStatus: HomeProductsStatusError(dataState.error as String)));
    }
  }
}
