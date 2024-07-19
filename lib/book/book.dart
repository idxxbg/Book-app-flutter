class Book {
  final String images;
  final String title;
  final String auther;
  final String publisher;
  final DateTime yearofpublisher;
  final String category;
  final String summary;
  final String content;
  final String language;

  const Book({
    required this.images,
    required this.title,
    required this.auther,
    required this.publisher,
    required this.yearofpublisher,
    required this.category,
    required this.content,
    required this.summary,
    required this.language,
  });
}

final List<Book> books = [
  Book(
    images: "assets/images/book 1.jpg",
    auther: "idxxbg",
    title: "Long time no see",
    publisher: "Damn.",
    yearofpublisher: DateTime(2024),
    category: "Knowledge",
    summary: "A brief summary of the book.",
    content:
        "Việc sử dụng các hình ảnh được tạo bởi AI từ nền tảng như OpenAI's DALL-E cho các mục đích thương mại cần được cân nhắc kỹ lưỡng dựa trên các điều khoản và điều kiện sử dụng của dịch vụ đó. Đây là một số điểm bạn cần xem xét:Bản Quyền và Sở Hữu Trí Tuệ: Hình ảnh được tạo ra bởi AI có thể chứa các yếu tố mà bản quyền không rõ ràng hoặc phức tạp do sự kết hợp và biến đổi của nhiều nguồn dữ liệu khác nhau trong quá trình đào tạo AI. Đảm bảo rằng hình ảnh không vi phạm bản quyền hoặc các quyền sở hữu trí tuệ khác.Điều Khoản Sử Dụng của OpenAI: Kiểm tra kỹ các điều khoản sử dụng của OpenAI hoặc bất kỳ nền tảng AI nào bạn sử dụng để tạo ảnh. Một số nền tảng có thể hạn chế việc sử dụng thương mại của các sản phẩm được tạo ra bởi công nghệ của họ.Chất Lượng và Độ Tin Cậy: Đánh giá chất lượng của hình ảnh và độ phù hợp của chúng với mục đích sử dụng của bạn. Hình ảnh AI đôi khi có thể không đạt chất lượng như mong đợi hoặc có thể chứa các yếu tố không mong muốn.Giấy Phép và Sử Dụng: Trong trường hợp bạn quyết định sử dụng hình ảnh, có thể cần phải xem xét các thỏa thuận pháp lý như giấy phép sử dụng để tránh vi phạm pháp luật.Khả năng Truy Vấn Pháp Lý: Xem xét liệu có khả năng bị kiện tụng hay không nếu sử dụng hình ảnh cho mục đích thương mại, đặc biệt nếu hình ảnh có thể bao gồm nội dung nhạy cảm hoặc được bảo hộ bản quyền.Nếu bạn dự định sử dụng các hình ảnh cho mục đích thương mại, khuyến nghị là hãy tham khảo ý kiến pháp lý hoặc liên hệ trực tiếp với OpenAI để có được sự rõ ràng về mặt pháp lý và đảm bảo tuân thủ tất cả các yêu cầu cần thiết. Điều này sẽ giúp bạn tránh phải đối mặt với các vấn đề pháp lý tiềm ẩn và đảm bảo rằng việc sử dụng hình ảnh là hoàn toàn hợp pháp và phù hợp.",
    language: "English",
  ),
  Book(
    images: "assets/images/book 2.jpg",
    auther: "Thomas Harris",
    title: "Hannibal Lecter",
    publisher: "Damn.",
    yearofpublisher: DateTime(1991),
    category: "Poem",
    summary: "A brief summary of the book.",
    content: """
    These are your own words
    your way of noticing
    and saying plainly
    of not turning away
    from hurt

    you have offered them 
    to me    I am only 
    giving them back 

    if only I could show you
    how very useless 
    they are not
     """,
    language: "English",
  ),
  Book(
    images: "assets/images/book 3.jpg",
    auther: "Arc",
    title: "Bird UnderStand",
    publisher: "Damn.",
    yearofpublisher: DateTime(2024),
    category: "Poem",
    summary: '''
Pagination involves a sequence of screens the user navigates sequentially. We chose a lateral motion for these transitions. When proceeding forward, the next screen emerges from the right; moving backward, the screen reverts to its original position. We felt that sliding the next screen entirely from the right could be overly distracting. As a result, we decided to move and fade in the next page using 30% of the modal side.
              ''',
    content: """
    These are your own words
    your way of noticing
    and saying plainly
    of not turning away
    from hurt

    you have offered them 
    to me    I am only 
    giving them back 

    if only I could show you
    how very useless 
    they are not
     """,
    language: "English",
  ),
  Book(
    images: "assets/images/book 4.jpg",
    auther: "idxxbg",
    title: "Always For The First Time",
    publisher: "Damn.",
    yearofpublisher: DateTime(2023),
    category: "Poem",
    summary:
        """ ‘Always For The First Time’ is André Breton’s ode to a woman he has not met, but is willing to wait every day for. Breton was the French founder of the surrealist movement, which aimed to blur the lines between dreams and reality in art — explaining the rather whimsical nature of this beautiful love poem. """,
    content: """
    There is a silk ladder unrolled across the ivy
    There is
    That leaning over the precipice 
    Of the hopeless fusion of your presence and absence 
    I have found the secret 
    Of loving you
    Always for the first time
     """,
    language: "English",
  ),
];
