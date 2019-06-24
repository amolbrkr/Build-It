/* This app is a webview implementation for https://build-it.in
 *
 * Author:
 * Amol Borkar <amolborkar5@gmail.com>
 *
 * Commissioned By:
 * Ramandeep Singh
 *
 */

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 24.0),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.replay),
              onPressed: () {
                _controller.reload();
              },
            )
          ],
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              _controller.loadUrl('https://build-it.in');
            },
          ),
        ),
        body: WebView(
          onWebViewCreated: (WebViewController _c) => _controller = _c,
          initialUrl: 'https://build-it.in',
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
