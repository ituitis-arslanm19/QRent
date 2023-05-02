import 'package:flutter/material.dart';
import 'package:qrent/core/base/state/base_state.dart';
import 'package:qrent/core/base/view/base_widget.dart';
import 'package:qrent/screen/booking/viewmodel/booking_view_model.dart';

class SlideWidget extends StatefulWidget {
  // final BookingViewModel viewModel;
  final double screenHeight;
  final double screenWidth;
  final BookingViewModel viewModel;

  SlideWidget(
      {Key? key,
      //required this.viewModel,
      required this.screenHeight,
      required this.screenWidth,
      required this.viewModel})
      : super(key: key);

  @override
  State<SlideWidget> createState() => _SlideWidgetState();
}

class _SlideWidgetState extends BaseState<SlideWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(vsync: this, duration: Duration(milliseconds: 750));

  late Animation<Offset> offset = Tween<Offset>(
          begin: Offset.zero, end: Offset(1.5, 0.0))
      .animate(CurvedAnimation(parent: controller, curve: Curves.easeInCirc));
  @override
  Widget build(BuildContext context) {
    return BaseView<BookingViewModel>(
      viewModel: widget.viewModel,
      onModelReady: (model) {
        model.init();
      },
      onPageBuilder: (BuildContext context, BookingViewModel viewModel) =>
          SlideTransition(position: offset),
    );
  }
}
