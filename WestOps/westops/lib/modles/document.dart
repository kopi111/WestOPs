class Document {
  final int id;
  final String title;
  final String pdfData; // Base64 encoded PDF data

  Document({
    required this.id,
    required this.title,
    required this.pdfData,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'],
      title: json['title'],
      pdfData: json['pdf_data'],
    );
  }
}
