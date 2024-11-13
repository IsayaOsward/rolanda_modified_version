import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/routes/routes.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:printing/printing.dart';

class Invoice extends StatelessWidget {
  final String htmlContent;

  const Invoice({super.key, required this.htmlContent});

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString(htmlContent)
      ..addJavaScriptChannel('PrintChannel',
          onMessageReceived: (message) async {
        // Trigger the print function when message 'print' is received
        if (message.message == 'print') {
          await Printing.layoutPdf(
            onLayout: (format) async {
              return await Printing.convertHtml(
                format: format,
                html: htmlContent,
              );
            },
          );
        }
      });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.homepage);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text('Close Invoice'),
          ),
        ),
      ),
    );
  }
}
