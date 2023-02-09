class Quote{
  final String id;
  final String content;
  final String author;


  Quote({
    required this.id,
    required this.content,
    required this.author,
  });

  @override
  String toString() {
    return 'Quote(id: $id, content: $content, author: $author)';
  }

}