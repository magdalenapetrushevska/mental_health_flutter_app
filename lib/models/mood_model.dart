class Mood{
  final String id;
  final String mood;
  final String datetime;

  Mood({
    required this.id,
    required this.mood,
    required this.datetime,
  });

  @override
  String toString() {
    return 'Mood(id: $id, mood: $mood, datetime: $datetime)';
  }

}