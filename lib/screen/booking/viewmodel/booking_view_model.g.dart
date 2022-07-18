// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookingViewModel on _BookingViewModelBase, Store {
  late final _$pageControlAtom =
      Atom(name: '_BookingViewModelBase.pageControl', context: context);

  @override
  PageControl get pageControl {
    _$pageControlAtom.reportRead();
    return super.pageControl;
  }

  @override
  set pageControl(PageControl value) {
    _$pageControlAtom.reportWrite(value, super.pageControl, () {
      super.pageControl = value;
    });
  }

  late final _$_BookingViewModelBaseActionController =
      ActionController(name: '_BookingViewModelBase', context: context);

  @override
  dynamic changePageControl(PageControl pageControl) {
    final _$actionInfo = _$_BookingViewModelBaseActionController.startAction(
        name: '_BookingViewModelBase.changePageControl');
    try {
      return super.changePageControl(pageControl);
    } finally {
      _$_BookingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageControl: ${pageControl}
    ''';
  }
}
