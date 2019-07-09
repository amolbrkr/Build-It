/* This app is a webview implementation for https://build-it.in
 *
 * Author:
 * Amol Borkar <amolborkar5@gmail.com>
 *
 * Commissioned By:
 * Ramandeep Sethi (Sethi Digital Zone)
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Build It',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Build It'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url;
  bool finishedLoading;
  final _webview = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    finishedLoading = false;
    url = 'https://build-it.in';
  }

  @override
  void dispose() {
    _webview.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 24.0),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.replay),
            onPressed: () {
              _webview.reload();
            },
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            _webview.reloadUrl(url);
          },
        ),
      ),
      url: url,
      withZoom: false,
      withJavascript: true,
      withLocalStorage: true,
      allowFileURLs: true,
      geolocationEnabled: true,
      appCacheEnabled: true,
      hidden: true,
      initialChild: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              height: 100.0,
            ),
            SizedBox(height: 20.0),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
