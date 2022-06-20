import 'package:dart_airtable/dart_airtable.dart';
import 'package:geoquiz/consts.dart';
import 'package:geoquiz/models/category.dart';
import 'package:geoquiz/models/question.dart';

import '../models/answer.dart';

class AirtableService {
  Future<List<Category>> getAirtableCategories() async {
    var airtable = Airtable(apiKey: apiKey, projectBase: projectBase);
    var records = await airtable.getAllRecords(recordNameCategories);
    final categories = <Category>[];

    if (records.isNotEmpty) {
      for (var element in records) {

        final  currentQusetion =  await getOrCreateUserProgress(element.fields[1].value.toString());

        var category = Category(
          id: element.id.toString(),
          numberOfTasks: element.fields[0].value as int,
          level: element.fields[3].value.toString(),
          description: element.fields[2].value.toString(),
          name: element.fields[1].value.toString(),
          progressValue: currentQusetion as int,
        );

        categories.add(category);
      }
    }

    return categories;
  }

  Future<Question> getAirtableQuestionByCategory(number, catId) async {
    var airtable = Airtable(apiKey: apiKey, projectBase: projectBase);
    var records = await airtable.getAllRecords(recordNameQuestions);
    final questions = <Question>[];

    if (records.isNotEmpty) {
      for (var element in records) {
        final  details = getQuestionValues(element);
        if (details['category'] == catId) {

          var question = Question(
            // ADD NUMBERING

            number: details['question'],
            categoryID: details['category'],
            pictureUrl: details['pictureUrl'],
          );
          questions.add(question);
        }
      }
    }


    final question = questions.firstWhere((element) => element.number == 1);
    questions.clear();


    return question;
  }



  Future<List<Answer>> getAirtableAnswersByQuestion(question) async {
    final answers = await getAnswers(question);
    return answers;
  }


  getAnswers(question) async {
    var airtable = Airtable(apiKey: apiKey, projectBase: projectBase);
    var records = await airtable.getAllRecords(recordNameAnswers);
    final answers = <Answer>[];
    if (records.isNotEmpty) {
      for (var element in records) {

        final Map details = getAnswerValues(element);


        var answer = Answer(
          description: details['desc'],
          category: details['category'],
          question: details['question'],
          right: details['right'],
        );

        answers.add(answer);
      }
    }
    return answers;
  }


  getAnswerValues(AirtableRecord airtableElement) {
    var details = new Map();

    final question = airtableElement.getField("Questions");
    if (question?.value  != null) {
      details['question'] = question!.value as int;
    }

    final category = airtableElement.getField("Categories");
    if (category?.value != null) {
      details['category'] =
          category!.value.toString().substring(1, category.value.toString().length - 1);
    }

    final desc = airtableElement.getField("Description");
    if (desc?.value  != null) {
      details['desc'] = desc!.value .toString();
    }

    final right = airtableElement.getField("Right");
    if (right?.value  != null) {
      details['right'] = true;
    }else{
      details['right'] = false;
    }

    return details;
  }

  getQuestionValues(AirtableRecord airtableElement) {
    var details = new Map();

    final question = airtableElement.getField("Question");
    if (question?.value != null) {

      details['question'] = question!.value as int;
    }

    final category = airtableElement.getField("Category");
    if (category?.value != null) {
      details['category'] =
          category!.value.toString().substring(1, category.value.toString().length - 1);
    }

    final pictureUrl = airtableElement.getField("Picture");
    if (pictureUrl?.value != null) {
      details['pictureUrl'] = pictureUrl?.value.toString();
    }

    return details;
  }


}

 getOrCreateUserProgress(catName) async {

  var airtable = Airtable(apiKey: apiKey, projectBase: projectBase);
  var records = await airtable.getAllRecords(recordNameCurrentProgress);
  if (records.isNotEmpty) {
    for (var element in records) {

      print(element.fields);

    }
  }
  else {
    print("1");
  }
  return 1;
}
