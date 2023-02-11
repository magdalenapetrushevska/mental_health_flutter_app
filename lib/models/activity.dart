class Activity{
  final String id;
  final String title;
  final int moodCategory;

  Activity({
    required this.id,
    required this.title,
    required this.moodCategory,
  });

  @override
  String toString() {
    return 'Activity(id: $id, title: $title, moodCateogry: $moodCategory)';
  }

}