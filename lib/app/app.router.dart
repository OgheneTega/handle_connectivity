// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:handle_connectivity/UI/views/homeView/home_view.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

class Routes {
  static const String homeView = '/';
  static const all = <String>{
    homeView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
  };
}
