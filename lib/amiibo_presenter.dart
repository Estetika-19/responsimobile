import 'package:responsi/amiibo_model.dart';
import 'package:responsi/base_network.dart';

abstract class AmiiboView {
  void showLoading();
  void hideLoading();
  void showAmiiboList(List<Amiibo> amiiboList);
  void showError(String message);
}

class AmiiboPresenter {
  final AmiiboView view;

  AmiiboPresenter(this.view);

  Future<void> loadAmiiboData(String endpoint) async {
    view.showLoading();
    try {
      // Expect a list of JSON objects from the API
      final List<dynamic> response = await BaseNetwork.getData(endpoint);

      // Map the list of JSON objects to a list of Amiibo instances
      final amiiboList = response.map((json) => Amiibo.fromJson(json)).toList();

      // Send the list to the view
      view.showAmiiboList(amiiboList);
    } catch (e) {
      view.showError("Failed to load data: $e");
    } finally {
      view.hideLoading();
    }
  }
}
