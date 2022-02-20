// a file to hold all of our necessary configurations, like routes, services, and logging
import 'package:handle_connectivity/UI/views/homeView/home_view.dart';
import 'package:handle_connectivity/services/apiservice.dart';
import 'package:handle_connectivity/services/connectivity_service.dart';
import 'package:handle_connectivity/services/superhero.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: HomeView, initial: true),
  ],
  dependencies: [
    Singleton(classType: SnackbarService),
    Singleton(classType: ConnectivityService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: SuperheroService)
  ],
  logger: StackedLogger(),
)
class AppSetup {}
