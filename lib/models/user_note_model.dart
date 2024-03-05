class NoteModel {
  final String userId;
  final String userNote;
  final String documentId;
  bool isChecked;
  NoteModel(
      {required this.userId,
      required this.userNote,
      required this.documentId,
      required this.isChecked});
  Map<String, dynamic> toJson() {
    return {
      'isChecked': isChecked,
      'documentId': documentId,
      'userId': userId,
      'userNote': userNote,
    };
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      isChecked: json['isChecked'],
      documentId: json['documentId'],
      userId: json['userId'],
      userNote: json['userNote'],
    );
  }
}
