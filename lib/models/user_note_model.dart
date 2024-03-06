class NoteModel {
  final String userId;
  final String userNote;
  final String documentId;
  final String title;
  bool isChecked;
  NoteModel(
      {required this.userId,
      required this.title,
      required this.userNote,
      required this.documentId,
      required this.isChecked});
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isChecked': isChecked,
      'documentId': documentId,
      'userId': userId,
      'userNote': userNote,
    };
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      title: json['title'],
      isChecked: json['isChecked'],
      documentId: json['documentId'],
      userId: json['userId'],
      userNote: json['userNote'],
    );
  }
}
