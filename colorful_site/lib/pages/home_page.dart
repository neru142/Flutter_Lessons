import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ポートフォリオ'),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'ようこそ！',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '私はFlutterやWeb開発などの経験豊富な開発者です。'
              '以下のプロジェクトをご覧ください。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 6, // プロジェクトの数
                itemBuilder: (context, index) => CustomCard(
                  title: 'プロジェクト ${index + 1}',
                  description: 'プロジェクト ${index + 1} の説明',
                  onPressed: () {
                    // プロジェクトの詳細ページへの遷移などのアクションを追加
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
