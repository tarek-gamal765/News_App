import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:news/components/components.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/cubit/states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return Conditional.single(
          conditionBuilder: (context) => list.isNotEmpty,
          context: context,
          widgetBuilder: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              separatorBuilder: (context, index) => myDivider(),
              itemBuilder: (context, index) {
                return buildNewsItem(
                  articles: list[index],
                  context: context,
                );
              }),
          fallbackBuilder: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
