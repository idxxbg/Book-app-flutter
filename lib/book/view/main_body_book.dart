import 'package:book_app_flutter/book/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:glass/glass.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import 'reader_view.dart';
import 'package:book_app_flutter/style.dart';

class MainBodyBook extends StatefulWidget {
  const MainBodyBook({super.key});

  @override
  State<MainBodyBook> createState() => _MainBodyBookState();
}

class _MainBodyBookState extends State<MainBodyBook> {
  @override
  Widget build(BuildContext context) {
    // TabController tabController = TabController(length: 4, vsync: this);
    final List<Book> poemBooks =
        books.where((book) => book.category == "Poem").toList();
    final List<Book> Knowledge =
        books.where((book) => book.category == "Knowledge").toList();
    double appBarHeight = AppBar().preferredSize.height;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    bool _isLightTheme = false;

    final WidgetStateProperty<Icon?> thumbIcon =
        WidgetStateProperty.resolveWith<Icon?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return const Icon(Icons.sunny);
        }
        return const Icon(Icons.cloud);
      },
    );

    return MaterialApp(
      themeMode: _isLightTheme ? ThemeMode.light : ThemeMode.dark,
      theme: ThemeData.light(useMaterial3: true).copyWith(),
      home: DefaultTabController(
        initialIndex: 0,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              MenuAnchor(
                builder: (context, controller, child) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade100,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                      ;
                    },
                    child: const Icon(Icons.settings),
                  );
                },
                menuChildren: [
                  MenuItemButton(
                    trailingIcon: Switch(
                      thumbIcon: thumbIcon,
                      value: !_isLightTheme,
                      onChanged: (_) =>
                          setState(() => _isLightTheme = !_isLightTheme),
                    ),
                    child: const Text('theme'),
                  ),
                ],
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    "Kiến thức luôn mở".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      color: Colors.black87,
                    ),
                  ),
                  subtitle: const Text(
                    "Hãy tiếp nhận có chọn lọc nhé !",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: Colors.black38,
                    ),
                  ),
                  trailing: SearchAnchor(
                    viewLeading: const Icon(Icons.menu_book_sharp),
                    builder: (context, controller) => const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.search),
                    ),
                    suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      return [
                        // ListView(),
                      ];
                    },
                  ),
                ),

                //Hot books
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  height: 300,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int i) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5)),
                          child: Image.asset(
                            width: 150,
                            "assets/images/book 1.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                //Category
                const TabBar(
                  dividerHeight: 1,
                  tabs: [
                    Tab(
                      child: Text(
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        "Toàn bộ",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Tư duy",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Thơ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Manga",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                //sach theo the loai

                Container(
                  // padding: EdgeInsets.symmetric(vertical: 20),
                  height: screenHeight * 0.6,
                  child: TabBarView(
                    children: [
                      Center(
                        child: ListBook(books),
                      ),
                      Center(
                        child: ListBook(Knowledge),
                      ),
                      Center(
                        child: ListBook(poemBooks),
                      ),
                      Center(
                        child: Text("It's snow here"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView ListBook(List<Book> category) {
    SliverWoltModalSheetPage page1(
        BuildContext modalSheetContext, TextTheme textTheme, Book book) {
      return WoltModalSheetPage(
        hasSabGradient: false,
        stickyActionBar: Padding(
          padding: const EdgeInsets.all(_pagePadding),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: Navigator.of(modalSheetContext).pop,
                child: const SizedBox(
                  height: _buttonHeight,
                  width: double.infinity,
                  child: Center(child: Text('Cancel')),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ReaderView(book: book)),
                  );
                },
                child: const SizedBox(
                  height: _buttonHeight,
                  width: double.infinity,
                  child: Center(child: Text('Next page')),
                ),
              ),
            ],
          ),
        ),
        topBarTitle: Text(book.auther, style: textTheme.titleMedium),
        heroImage: ClipRRect(child: Image.asset(book.images)),
        pageTitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(book.title, style: textTheme.titleLarge),
        ),
        isTopBarLayerAlwaysVisible: true,
        trailingNavBarWidget: IconButton( 
          padding: const EdgeInsets.all(_pagePadding),
          icon: const Icon(Icons.close).asGlass(
              clipBorderRadius: BorderRadius.circular(50),
              tintColor: Colors.black12),
          onPressed: Navigator.of(modalSheetContext).pop,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            _pagePadding,
            _pagePadding,
            _pagePadding,
            _bottomPaddingForButton,
          ),
          child: Text(
            book.summary,
          ),
        ),
        sabGradientColor: Colors.blue,
      );
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: category.length,
      itemBuilder: (BuildContext context, int b) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, left: 10, bottom: 10),
              child: InkWell(
                splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                onTap: () {
                  final book = category[b];
                  WoltModalSheet.show(
                    context: context,
                    pageListBuilder: (context) {
                      final textTheme = Theme.of(context).textTheme;
                      return [
                        page1(context, textTheme, book),
                      ];
                    },
                    // modalTypeBuilder: (_) => WoltModalType.bottomSheet(),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: category[b],
                      child: Container(
                        height: 170,
                        width: 100,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5), // Màu sắc của bóng
                              spreadRadius: 2, // Độ rộng của vùng bóng đổ
                              blurRadius: 10, // Độ mờ của bóng đổ
                              offset: const Offset(6, 2), // Vị trí của bóng đổ
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            category[b].images,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: SizedBox(
                        height: 170,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(category[b].title),
                              titleTextStyle: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black54),
                              subtitle: Text("By ${category[b].auther}"),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, left: 10),
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 5,
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      "Read",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ShortView extends StatelessWidget {
  final Book book;
  const ShortView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(book.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.bookmark_border), // Icon lưu trang
              onPressed: () {
                // Thêm hành động lưu trang tại đây
              },
            ),
            IconButton(
              icon: const Icon(Icons.share), // Icon chia sẻ
              onPressed: () {
                // Thêm hành động chia sẻ tại đây
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border), // Icon yêu thích
              onPressed: () {
                // Thêm hành động thêm vào yêu thích tại đây
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: book,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 250,
                    width: 150,
                    child: Image.asset(
                      book.images,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Gap(20),
              Expanded(
                child: Container(
                  // height: screenHeight ,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade300,
                    // shape: BoxShape.circle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [Text(book.auther)],
                  ),
                ).asGlass(),
              ),
            ],
          ),
        ));
  }
}

const double _bottomPaddingForButton = 150.0;
const double _buttonHeight = 56.0;
const double _buttonWidth = 200.0;
const double _pagePadding = 16.0;
const double _pageBreakpoint = 768.0;
const double _heroImageHeight = 250.0;
const Color _lightThemeShadowColor = Color(0xFFE4E4E4);
const Color _darkThemeShadowColor = Color(0xFF121212);
const Color _darkSabGradientColor = Color(0xFF313236);
