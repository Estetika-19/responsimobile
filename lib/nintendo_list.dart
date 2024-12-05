import 'package:flutter/material.dart';
import 'package:responsi/amiibo_model.dart';
import 'package:responsi/amiibo_presenter.dart';

class AmiiboListScreen extends StatefulWidget {
  const AmiiboListScreen({super.key});

  @override
  State<AmiiboListScreen> createState() => _AmiiboListScreenState();
}

class _AmiiboListScreenState extends State<AmiiboListScreen>
    implements AmiiboView {
  late AmiiboPresenter _presenter;
  bool _isLoading = false;
  List<Amiibo> _amiiboList = [];
  String? _errorMessage;
  final String _currentEndpoint =
      'https://www.amiiboapi.com/api/amiibo'; // Use full URL

  @override
  void initState() {
    super.initState();
    _presenter = AmiiboPresenter(this);
    _fetchData(_currentEndpoint);
  }

  void _fetchData(String endpoint) {
    setState(() {
      _isLoading = true;
      _errorMessage = null; // Reset error message
      _amiiboList.clear(); // Clear previous list
    });
    _presenter.loadAmiiboData(endpoint);
  }

  @override
  void showLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void showAmiiboList(List<Amiibo> amiiboList) {
    setState(() {
      _amiiboList = amiiboList;
    });
  }

  @override
  void showError(String message) {
    setState(() {
      _errorMessage = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Amiibo List"),
      ),
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _errorMessage != null
                    ? Center(child: Text("Error: $_errorMessage"))
                    : _amiiboList.isEmpty
                        ? const Center(child: Text("No Amiibo data found."))
                        : ListView.builder(
                            itemCount: _amiiboList.length,
                            itemBuilder: (context, index) {
                              final amiibo = _amiiboList[index];
                              return ListTile(
                                leading: amiibo.image.isNotEmpty
                                    ? Image.network(
                                        amiibo.image,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      )
                                    : const Icon(Icons.image_not_supported),
                                title: Text(amiibo.name),
                                subtitle:
                                    Text('Game Series: ${amiibo.gameSeries}'),
                                onTap: () {
                                  // Handle tap
                                },
                              );
                            },
                          ),
          ),
        ],
      ),
    );
  }
}
