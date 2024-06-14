import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final List<String> _faqs = [
    'このアプリの使い方は？',
    'パスワードをリセットするには？',
    'サポートに連絡する方法は？',
    'さらに情報を見つけるには？',
  ];

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ヘルプ'),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: '検索',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _faqs.length,
                itemBuilder: (context, index) {
                  if (_faqs[index]
                      .toLowerCase()
                      .contains(_searchQuery.toLowerCase())) {
                    return ListTile(
                      title: Text(_faqs[index]),
                      onTap: () {
                        // FAQの詳細を表示
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // ここにアクションを追加
              },
              child: Text('サポートに連絡'),
            ),
          ],
        ),
      ),
    );
  }
}
