class Article{
  final String id;
  final String title;
  final String content;
  final String imageUrl;

  Article({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
  });

  @override
  String toString() {
    return 'Article(id: $id, title: $title, content: $content, imageUrl: $imageUrl)';
  }

}