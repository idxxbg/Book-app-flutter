import 'dart:math';

import 'package:book_app_flutter/book/book.dart';
import 'package:book_app_flutter/book/view/main_body_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../style.dart';

class ReaderView extends StatefulWidget {
  const ReaderView({super.key, required this.book});
  final Book book;
  @override
  _ReaderViewState createState() => _ReaderViewState();
}

class _ReaderViewState extends State<ReaderView> {
  final PageController _pageController = PageController();
  List<String> pages = []; // Danh sách các trang được tạo từ nội dung sách
  bool showFab = false;

  @override
  void initState() {
    super.initState();
    pages = _splitContentIntoPages(
        widget.book.content); // Giả định bạn có một hàm để chia nội dung
  }

  List<String> _splitContentIntoPages(String content) {
    // Chia nội dung thành các trang dựa trên logic của bạn
    // Ví dụ đơn giản: chia nội dung thành các phần mỗi phần 500 ký tự
    List<String> pages = [];
    int pageSize = 500; // Giả định mỗi trang có 500 ký tự

    int start = 0;
    while (start < content.length) {
      int end = min(start + pageSize, content.length);
      if (end < content.length) {
        // Tìm khoảng trắng gần vị trí end để tránh cắt ngang từ
        int lastSpace = content.lastIndexOf(' ', end);
        if (lastSpace > start) {
          end = lastSpace;
        }
      }
      pages.add(content.substring(start, end).trim());
      start = end;
    }
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: showFab
          ? FloatingActionButton(
              tooltip: "last page",
              onPressed: () {
                if (_pageController.page?.toInt() == pages.length - 1) {
                  // Đã đến trang cuối
                  Tooltip;
                  // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Last page')))
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: const Icon(Icons.arrow_forward),
            )
          : null,
      appBar: AppBar(
        title: const Text('Reader View'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {
              // Xử lý khi người dùng nhấn nút lưu

              print('Bookmark the page');
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Xử lý khi người dùng nhấn nút thích
              print('Favorite the book');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Xử lý khi người dùng nhấn nút thích
              print('setting');
            },
          ),
        ],
      ),
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollinfo) {
              if (scrollinfo.metrics.pixels ==
                  scrollinfo.metrics.maxScrollExtent) {
                if (!showFab) {
                  setState(() {
                    showFab = true;
                  });
                }
              } else if (_pageController.page?.toInt() == pages.length - 1) {
                if (showFab) {
                  setState(() {
                    showFab = false;
                  });
                }
              } else {
                if (showFab) {
                  setState(() {
                    showFab = false;
                  });
                }
              }
              return true;
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: _pagePadding),
                child: Column(
                  children: [
                    Image.asset(widget.book.images),
                    Text(
                      pages[index],
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPage(Book book) {
    return Center(
      child: Text(
        book.content,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
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
