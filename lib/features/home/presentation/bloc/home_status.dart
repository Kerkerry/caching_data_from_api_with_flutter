import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:offlineapp/features/home/data/model/products_model.dart';

@immutable
abstract class HomeProductsStatus extends Equatable {
  const HomeProductsStatus();

  @override
  List<Object> get props => [];
}

class HomeProductsStatusInit extends HomeProductsStatus {}

class HomeProductsStatusLoading extends HomeProductsStatus {}

class HomeProductsStatusError extends HomeProductsStatus {
  final String errorMsg;
  const HomeProductsStatusError(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}

class HomeProductsStatusCompleted extends HomeProductsStatus {
  final ProductsModel products;
  const HomeProductsStatusCompleted(this.products);

  @override
  List<Object> get props => [products.limit,products.message,products.success,products.totalProducts];
}
