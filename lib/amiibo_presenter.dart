import 'package:responsi/amiibo_model.dart';
import 'package:responsi/base_network.dart';

abstract class AmiiboView {
  void showLoading();
  void hideLoading();
  void showAmiiboList(List<Amiibo> amiiboList);
  void ShowError(String message);
}

class AmiiboPresenter {
  final AmiiboView view;
  AmiiboPresenter(this.view);

  Future<void> loadAnimeData(String endpoint) async {
    try {
      final List<dynamic> data = await BaseNetwork.getData(endpoint);
      final amiibolist = data.map((json) => Amiibo.fromJson(json)).toList();
      view.showAmiiboList(amiibolist);
    } catch (e) {
      view.ShowError(e.toString());
    } finally {
      view.hideLoading();
    }
  }

  void loadAmiiboData(String endpoint) {}
}
