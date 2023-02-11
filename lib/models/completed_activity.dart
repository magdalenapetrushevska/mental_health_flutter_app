class CompletedActivity{
  final String id;
  final String title;
  final String isCompleted;

  CompletedActivity({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  @override
  String toString() {
    return 'Activity(id: $id, title: $title, isCompleted: $isCompleted)';
  }

}