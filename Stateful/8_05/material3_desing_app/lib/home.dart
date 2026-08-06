import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material3 Design'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(    // 색깔 볼 수 있는 그룹 // expanded를 하면 확장해줘서 꽉 차게 보임
                    height: 50,
                    color: Theme.of(context).colorScheme.primary, // 메인의 line 16부분을 참고
                    alignment: Alignment(0, 0), // 중앙으로 맞춰줌
                    child: Text(
                      'Primary Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(    // 보호색
                    height: 50,
                    color: Theme.of(context).colorScheme.secondary,
                    alignment: Alignment(0, 0), 
                    child: Text(
                      'Secondary Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(    
                    height: 50,
                    color: Theme.of(context).colorScheme.tertiary,
                    alignment: Alignment(0, 0), 
                    child: Text(
                      'Tertiary Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onTertiary
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(    
                    height: 50,
                    color: Theme.of(context).colorScheme.error,
                    alignment: Alignment(0, 0), 
                    child: Text(
                      'Error Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onError
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(    
                    height: 50,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Primary Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(    // 보호색
                    height: 50,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    alignment: Alignment(0, 0), 
                    child: Text(
                      'Secondary Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondaryContainer
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(    
                    height: 50,
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    alignment: Alignment(0, 0), 
                    child: Text(
                      'Tertiary Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onTertiaryContainer
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(    
                    height: 50,
                    color: Theme.of(context).colorScheme.errorContainer,
                    alignment: Alignment(0, 0), 
                    child: Text(
                      'Error Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onErrorContainer
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}