import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solidsolutionweb/core/base_model.dart';
import 'locator.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child)? builder;
  final Function(T)? onModelReady; //Display the ready function
  final Function(T)? onDispose; //Display the dispose function

  const BaseView({
    Key? key,
    this.builder,
    this.onModelReady,
    this.onDispose,
  }) : super(key: key);

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locatorX<T>();
  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) {
      Future.delayed(
        Duration.zero,
        () {
          widget.onModelReady!(model);
        },
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) {
      widget.onDispose!(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder!,
      ),
    );
  }
}
