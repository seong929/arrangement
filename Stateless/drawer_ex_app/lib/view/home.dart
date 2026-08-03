import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mail'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () => sendmail(context, '/send'), 
            icon: Icon(Icons.email),
          ),
          IconButton(
            onPressed: () => Receivedmail(context, '/receive'), 
            icon: Icon(Icons.email_outlined)
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-2.jpg'),
              ),
              accountName: Text('Pikachu'), 
              accountEmail: Text('Pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.blue,
              ),
              title: Text('보낸 편지함'),
              onTap: () => sendmail(context, '/send'),
            ),
            ListTile(
              leading: Icon(
                Icons.email_outlined,
                color: Colors.red,
              ),
              title: Text('받은 편지함'),
              onTap: () => Receivedmail(context, 'receive'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => sendmail(context, '/send'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10)
                ),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ), 
              child: Text('보낸편지함'),
            ),
            ElevatedButton(
              onPressed: () => Receivedmail(context, '/receive'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10)
                ),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ), 
              child: Text('받은편지함'),
            ),
          ],
        )
      ),
    );
  }


  void sendmail(BuildContext context, String){         
    Navigator.pushNamed(context, '/send');
  }

  void Receivedmail(BuildContext context, String){
    Navigator.pushNamed(context, '/receive');
  }
}