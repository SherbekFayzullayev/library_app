import 'package:flutter/material.dart';
import 'package:library_app/box_component/book/book_model.dart';
import 'package:library_app/box_component/book/bookcard_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Book> _allBooks = [
    const Book(
      title: 'Atom odatlar',
      author: 'James Clear',
      imageUrl: 'assets/images/atom_odatlar.jpg',
      rating: 5.0,
      pdfUrl: 'assets/pdf/atom_odatlar.pdf',
      cardColor: Color.fromARGB(255, 239, 213, 188),
      category: "Rivojlanish",
      pages: 320,
      synopsis: "Ushbu kitobda kichik, kundalik odatlar hayotimizni qanday o'zgartirishi haqida amaliy maslahatlar berilgan.",
      price: "\$6.99",
    ),
    const Book(
      title: 'Jinoyat va Jazo',
      author: 'Достоевский',
      imageUrl: 'assets/images/jinoyat_va_jazo.jpg',
      rating: 5.0,
      pdfUrl: 'assets/pdf/jinoyat_va_jazo.pdf',
      cardColor: Color(0xFFFFFBEA),
      category: "Klassika",
      pages: 671,
      synopsis: "Fedor Dostoevskiyning ushbu klassik asari talaba Raskolnikovning jinoyati va uning vijdon azobini tahlil qiladi.",
      price: "\$8.49",
    ),
    const Book(
      title: 'Sevaman dema',
      author: 'Mirach Chagri',
      imageUrl: 'assets/images/sevaman_dema.webp',
      rating: 4.9,
      pdfUrl: 'assets/pdf/sevaman_dema.pdf',
      cardColor: Color.fromARGB(255, 255, 223, 255),
      category: "Dramatik asarlar",
      pages: 180,
      synopsis: "Mirach Chagri qalamiga mansub bu asar sevgi va munosabatlar haqidagi chuqur o'y-fikrlarni o'z ichiga oladi.",
      price: "\$5.99",
    ),
    const Book(
      title: 'Eng boy odam',
      author: 'George S. Clason',
      imageUrl: 'assets/images/vavilonlik_eng_boy_odam.webp',
      rating: 4.5,
      pdfUrl: 'assets/pdf/vavilonlik_eng_boy_odam.pdf',
      cardColor: Color.fromARGB(255, 203, 233, 252),
      category: "Rivojlanish",
      pages: 192,
      synopsis: "Ushbu kitob moliyaviy muvaffaqiyatga erishish uchun Vavilonlik eng boy odamning sir-asrorlarini ochib beradi.",
      price: "\$7.50",
    ),
    const Book(
      title: 'Taslim bo\'lma',
      author: 'A.H.',
      imageUrl: 'assets/images/taslim_bolma.jpg',
      rating: 4.0,
      pdfUrl: 'assets/pdf/taslim_bolma.pdf',
      cardColor: Color(0xFFFFFBEA),
      category: "Motivatsiya",
      pages: 150,
      synopsis: "Hayotdagi qiyinchiliklarga qaramay, taslim bo'lmaslikka undovchi kuchli motivatsion hikoyalar to'plami.",
      price: "\$5.25",
    ),
    const Book(
      title: 'Menga baxtni ko\'rsat',
      author: 'Ezgin Kilich',
      imageUrl: 'assets/images/menga_baxtni_korsat.webp',
      rating: 4.1,
      pdfUrl: 'assets/pdf/menga_baxtni_korsat.pdf',
      cardColor: Color.fromARGB(255, 228, 158, 93),
      category: "Rivojlanish",
      pages: 200,
      synopsis: "Ezgin Kilichning ushbu asari insonning ichki dunyosiga sayohat qilib, baxtni topishga undaydi.",
      price: "\$6.50",
    ),
    const Book(
      title: 'Kichkina shahzoda',
      author: 'Antoine de Saint-Exupéry',
      imageUrl: 'assets/images/kichkina_shaxzoda.jpg',
      rating: 4.1,
      pdfUrl: 'assets/pdf/kichkina_shaxzoda.pdf',
      cardColor: Color.fromARGB(255, 50, 83, 122),
      category: "Fantastika",
      pages: 96,
      synopsis: "Katta yoshlilar va bolalar uchun birdek muhim bo'lgan bu asar do'stlik, sevgi va hayot ma'nosi haqida.",
      price: "\$9.99",
    ),
    const Book(
      title: 'Choliqushi',
      author: 'Reşat Nuri Güntekin',
      imageUrl: 'assets/images/choliqushi.jpg',
      rating: 4.7,
      pdfUrl: 'assets/pdf/choliqushi.pdf',
      cardColor: Color.fromARGB(255, 255, 205, 174),
      category: "Klassika",
      pages: 400,
      synopsis: "Feride ismli yosh o'qituvchining Anado'lidagi hayoti va sevgisini topishi haqida klassik turk romani.",
      price: "\$7.99",
    ),
    const Book(
      title: '8 soat uxlaydi',
      author: 'ERDAL DEMIRKIRAN',
      imageUrl: 'assets/images/axmoqlar.jpg',
      rating: 4.7,
      pdfUrl: 'assets/pdf/axmoqlar_sakkiz_soat_uxlaydi.pdf',
      cardColor: Color.fromARGB(255, 197, 245, 255),
      category: "Motivatsiya",
      pages: 180,
      synopsis: "Kamroq uxlab, ko'proq ishlash orqali muvaffaqiyatga erishish mumkinligini isbotlashga harakat qiluvchi motivatsion asar.",
      price: "\$5.50",
    ),
    const Book(
      title: 'Nur borki, soya bor',
      author: 'O\'tkir Hoshimov',
      imageUrl: 'assets/images/nur_borki.jpg',
      rating: 4.7,
      pdfUrl: 'assets/pdf/nur_borki_soya_bor.pdf',
      cardColor: Color.fromARGB(255, 255, 197, 197),
      category: "Klassika",
      pages: 350,
      synopsis: "O'zbek adabiyotining durdonasi hisoblangan bu asar yorug'lik va zulmat, yaxshilik va yomonlik kurashi haqida.",
      price: "\$9.25",
    ),
  ];

  // Qidiruv natijalarini saqlash uchun ro'yxat
  List<Book> _filteredBooks = [];

  //// Kategoriyalar ro'yxati
  final List<String> _categories = const [
    'Hammasi',
    'Fantastika',
    'Motivatsiya',
    'Klassika',
    'Rivojlanish',
    'Dramatik asarlar',
    'Detektiv',
  ];


  String _selectedCategory = 'Hammasi';

  @override
  void initState() {
    super.initState();
    _filteredBooks = _allBooks; 
  }

  void _filterBooks(String query) {
    List<Book> results = [];
    if (query.isEmpty) {
      results = _allBooks; 
    } else {
      results = _allBooks.where((book) {
        final bookTitle = book.title.toLowerCase();
        final bookAuthor = book.author.toLowerCase();
        final searchQuery = query.toLowerCase();

        return bookTitle.contains(searchQuery) ||
            bookAuthor.contains(searchQuery);
      }).toList();
    }


    if (_selectedCategory != 'Hammasi') {
      results = results
          .where((book) => book.category == _selectedCategory)
          .toList();
    }

    setState(() {
      _filteredBooks = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
            ),
            children: [
              TextSpan(
                text: 'Book',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: ' Junction',
                style: TextStyle(color: Color.fromARGB(255, 254, 171, 255)),
              ),
            ],
          ),
        ),
        elevation: 0,

        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              print('Bildirishnoma tugmasi bosildi!');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SearchBar(onSearch: _filterBooks),
            const SizedBox(height: 20),

            /// kategoriyalar bolimi
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      showCheckmark: false,
                      label: Text(category),
                      selected: _selectedCategory == category,
                      onSelected: (selected) {
                        setState(() {
                          _selectedCategory = category;

                          _filterBooks('');
                        });
                      },
                      selectedColor: Theme.of(context).primaryColor,
                      labelStyle: TextStyle(
                        color: _selectedCategory == category
                            ? Colors.white
                            : Colors.black87,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: _selectedCategory == category
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade300,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 10),

            Text(
              'Best Sellers',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: _filteredBooks.isEmpty
                  ? Center(
                      child: Text(
                        'Bunday turdagi kitoblar mavjud emas 🙁',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    )
                  : GridView.builder(
                      itemCount: _filteredBooks.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 2 ta ustun
                            crossAxisSpacing:
                                16.0, // Ustunlar orasidagi bo'sh joy
                            mainAxisSpacing:
                                16.0, // Qatorlar orasidagi bo'sh joy
                            childAspectRatio: 0.6, // Karta nisbati
                          ),
                      itemBuilder: (context, index) {
                        final book = _filteredBooks[index];
                        return BookCard(book: book);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

//************** */               // Search bar widgeti *************************//

class _SearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const _SearchBar({Key? key, required this.onSearch}) : super(key: key);

  @override
  State<_SearchBar> createState() => __SearchBarState();
}

class __SearchBarState extends State<_SearchBar> {
  // Matnni boshqarish uchun controller
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    // Matn o'zgarganda onSearch funksiyasini chaqirish
    _searchController.addListener(() {
      widget.onSearch(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search for books',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.mic, color: Colors.grey),
            onPressed: () {
              // Bu yerga ovozli qidiruv funksiyasini qo'shishingiz mumkin
              // Hozircha bu tugma hech narsa qilmaydi
              print('Mikrofon tugmasi bosildi!');
            },
          ),
        ],
      ),
    );
  }
}
