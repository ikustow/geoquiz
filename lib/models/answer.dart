import 'package:geoquiz/models/category.dart';
import 'package:geoquiz/models/question.dart';

class Answer{
  final String description;
  final String category;
  final int question;
  final bool right;

  Answer({
    required this.description,
    required this.category,
    required this.question,
    required this.right,
  });

}