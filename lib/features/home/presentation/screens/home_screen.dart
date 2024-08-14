import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offlineapp/core/utils/custom_loading_widget.dart';
import 'package:offlineapp/features/home/data/model/product_model.dart';
import 'package:offlineapp/features/home/data/model/products_model.dart';
import 'package:offlineapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:offlineapp/features/home/presentation/bloc/home_status.dart';
import 'package:offlineapp/features/home/presentation/widgets/home_single_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    Size size;
    double height, width;
    size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    final ThemeData theme=Theme.of(context);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Column(
          children: [
            const Text("Caching With BLOC & HIVE"),
            Text("@ProgrammingWithFlexz",style: theme.textTheme.labelMedium!.copyWith(color:Colors.grey),)
          ],
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: BlocConsumer<HomeBloc, HomeState>(
          builder: (context, state){
            if(state.homeProductsStatus is HomeProductsStatusInit){
              return Container();
            }
          if(state.homeProductsStatus is HomeProductsStatusLoading){
              return CustomLoading.show(context);
          }

          if(state.homeProductsStatus is HomeProductsStatusError){
             final HomeProductsStatusError emPost=state.homeProductsStatus as HomeProductsStatusError;
             final String errorMsg=emPost.errorMsg;
             return Center(child: Text(errorMsg),);
          }

          if(state.homeProductsStatus is HomeProductsStatusCompleted){
             final HomeProductsStatusCompleted cmPost=state.homeProductsStatus as HomeProductsStatusCompleted;
             final ProductsModel productsModel=cmPost.products;
             return ListView.builder(
              itemCount: productsModel.products.length,
              itemBuilder: (context, index){
                final ProductModel current=productsModel.products[index];
                return HomeSingleListItme(
                  current: current);
             },);
          }

            return Container();
          }, 
        listener: (context, state) {
          
        },),
      ),
    );
  }
}