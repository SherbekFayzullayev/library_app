import 'package:flutter/material.dart';
import 'package:library_app/box_component/book/book_model.dart';
import 'package:library_app/box_component/pdf_view/pdf_view_widget.dart';

// Kitobning batafsil ma'lumotlari sahifasi
class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar o'rniga CustomScrollView va SliverAppBar ishlatish yaxshiroq bo'ladi
      // lekin sodda dizayn uchun oddiy AppBar ishlatamiz.
      appBar: AppBar(
        title: Text(book.title),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Kitob muqovasi uchun yuqori qism
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: book.imageUrl.startsWith('http')
                      ? NetworkImage(book.imageUrl) as ImageProvider
                      : AssetImage(book.imageUrl) as ImageProvider,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: book.imageUrl.startsWith('http')
                      ? Image.network(
                          book.imageUrl,
                          fit: BoxFit.cover,
                          height: 180,
                          width: 120,
                        )
                      : Image.asset(
                          book.imageUrl,
                          fit: BoxFit.cover,
                          height: 180,
                          width: 120,
                        ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      book.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                    ),
                  ),
                  Center(
                    child: Text(
                      book.author,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.grey.shade600,
                          ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _infoChip(
                          label: '${book.rating}',
                          color: Colors.amber,
                        ),
                        _infoChip(
                          label: book.category,
                          color: Colors.blue,
                        ),
                        _infoChip(
                          label: '${book.pages} Sahifa',
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Synopsis',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    book.synopsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  // Agar PDF mavjud bo'lsa, tugmani ko'rsatish
                  if (book.pdfUrl != null) ...[
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PdfViewerPage(pdfUrl: book.pdfUrl!),
                            ),
                          );
                        },
                        child: const Text('PDF o\'qish'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _infoChip({ required String label, required Color color}) {
    return Column(
      children: [
       
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
