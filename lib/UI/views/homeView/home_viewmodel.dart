// for the UI Code
import 'dart:io';
import 'package:handle_connectivity/app/app.locator.dart';
import 'package:handle_connectivity/app/app.logger.dart';
import 'package:handle_connectivity/models/superheroresponse_model.dart';
import 'package:handle_connectivity/services/connectivity_service.dart';
import 'package:handle_connectivity/services/superhero.dart';
import 'package:handle_connectivity/utils/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends StreamViewModel {
  final _connectivityService = locator<ConnectivityService>();
  final _snackbarService = locator<SnackbarService>();
  final _superheroService = locator<SuperheroService>();
  final log = getLogger('HomeViewModel');

  SuperheroResponse? superHeroDetail;

  bool connectionStatus = false;
  bool hasCalled = false;
  bool hasShownSnackbar = false;

  Stream<bool> checkConnectivity() async* {
    yield await _connectivityService.checkInternetConnection();
  }

  @override
  // TODO: implement stream
  Stream get stream => checkConnectivity();

  bool get status {
    stream.listen((event) {
      connectionStatus = event;
      notifyListeners();
      if (hasCalled == false) getCharacters();
    });
    return connectionStatus;
  }

  Future<void> getCharacters() async {
    if (connectionStatus == true) {
      try {
        superHeroDetail = await runBusyFuture(
          _superheroService.getCharactersDetails(),
          throwException: true,
        );
        // 6b:  We set the 'hasCalled' boolean to true only if the call is successful, which then prevents the app from re-fetching the data
        hasCalled = true;
        notifyListeners();
      } on SocketException catch (e) {
        hasCalled = true;
        notifyListeners();
        // 8
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.negative,
          message: e.toString(),
        );
      } on Exception catch (e) {
        hasCalled = true;
        notifyListeners();
        // 8
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.negative,
          message: e.toString(),
        );
      }
    } else {
      log.e('Internet Connectivity Error');
      if (hasShownSnackbar == false) {
        // 8
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.negative,
          message: 'Error: Internet Connection is weak or disconnected',
          duration: const Duration(seconds: 5),
        );
        hasShownSnackbar = true;
        notifyListeners();
      }
    }
  }
}
