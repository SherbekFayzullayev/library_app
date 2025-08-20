
                  // PDF faylini ko'rsatish uchun yangi sahifa//

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PdfViewerPage extends StatefulWidget {
  final String pdfUrl;
  const PdfViewerPage({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String? _localPdfPath;
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      // PDF URLini tekshirish
      if (widget.pdfUrl.startsWith('http')) {
        // Tarmoq orqali yuklash
        final response = await http.get(Uri.parse(widget.pdfUrl));
        final documentDirectory = await getApplicationDocumentsDirectory();
        final file = File('${documentDirectory.path}/temp_pdf.pdf');
        await file.writeAsBytes(response.bodyBytes);
        _localPdfPath = file.path;
      } else {
        // Lokal fayl (assetsdan)
        final ByteData data = await rootBundle.load(widget.pdfUrl);
        final documentDirectory = await getApplicationDocumentsDirectory();
        final file = File(
          '${documentDirectory.path}/${widget.pdfUrl.split('/').last}',
        );
        final List<int> bytes = data.buffer.asUint8List(
          data.offsetInBytes,
          data.lengthInBytes,
        );
        await file.writeAsBytes(bytes);
        _localPdfPath = file.path;
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'PDF faylini yuklab olishda xatolik yuz berdi: $e';
        _isLoading = false;
      });
      print('Error loading PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kitobni o\'qish')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
          ? Center(child: Text(_errorMessage))
          : PDFView(
              filePath: _localPdfPath!,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: true,
              onRender: (_pages) {
                print("Sahifalar soni: $_pages");
              },
              onError: (error) {
                print(error.toString());
              },
            ),
    );
  }
}