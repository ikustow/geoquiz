import 'dart:convert';

import 'package:dart_airtable/dart_airtable.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geoquiz/consts.dart';
import 'package:geoquiz/models/category.dart';
import 'package:geoquiz/models/category_dio.dart';
import 'package:geoquiz/models/current_progress.dart';
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

  Future<Question> getAirtableQuestionByCategory(name, catId, questionNumber) async {
    var airtable = Airtable(apiKey: apiKey, projectBase: projectBase);
    var records = await airtable.getAllRecords(recordNameQuestions);
    final questions = <Question>[];


    if (records.isNotEmpty) {
      for (var element in records) {
        final  details = getQuestionValues(element);
        if (details['category'] == name) {

          var question = Question(
            number: details['question'],
            categoryID: details['category'],
            pictureUrl: details['pictureUrl'],
            categoryName: name,
          );
          questions.add(question);
        }
      }
    }

    final question = questions.firstWhere((element) => element.number == questionNumber);
    questions.clear();

    return question;
  }



  Future<List<Answer>> getAirtableAnswersByQuestion(question, questionNumber) async {
    final answers = await getAnswers(question, questionNumber);
    return answers;
  }


  Future <CurrentProgress> getAirtableProgressByUser() async {
    final currenUser = FirebaseAuth.instance.currentUser!.email.toString();

    final response = await Dio().get(
      'https://api.airtable.com/v0/$projectBase/$recordNameCurrentProgress',

      options: Options(
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Accept': 'Application/json',
        },
      ),
    );

    final curProgress = CurrentProgress.fromJson(response.data);
    return curProgress;
  }


  getAnswers(question, questionNumber) async {
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

        if (answer.question == questionNumber ){
        answers.add(answer);
        }

      }
    }
    return answers;
  }


  getAnswerValues(AirtableRecord airtableElement,) {
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
      details['category'] =  category!.value.toString();
    }

    final pictureUrl = airtableElement.getField("Picture");
    if (pictureUrl?.value != null) {
      details['pictureUrl'] = pictureUrl?.value.toString();
    }

    return details;
  }


  Future<int> updateUserStatus (catName, currentNumber) async {

    var currentQuestion = currentNumber + 1;
    final currenUser = FirebaseAuth.instance.currentUser!.email.toString();

    final response = await Dio().get(
      'https://api.airtable.com/v0/$projectBase/$recordNameCurrentProgress',
      queryParameters: {
        'filterByFormula': 'SEARCH("$catName",{Category})'
        // Searches the value 'Cactus' in the 'Short description' field.
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Accept': 'Application/json',
        },
      ),
    );

    final curProgress = CurrentProgress.fromJson(response.data);
    final filteredRecords = curProgress.records.firstWhere((element) => element.fields.category == catName && element.fields.user == currenUser);
    final id = filteredRecords.id;
    final fieldCategory = catName;
    final fieldProgressNumber  = currentQuestion;

    final response1 = await Dio().patch(
      'https://api.airtable.com/v0/$projectBase/$recordNameCurrentProgress',
      options: Options(
        contentType: 'Application/json',
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Accept': 'Application/json',
        },
      ),
      data: {
        'records': [
          {
            'id': '$id',
            'fields': {
              'Category': '$fieldCategory',
              'Question': fieldProgressNumber,
            }
          },
        ],
      },
    );

    return currentQuestion;

  }



  Future<int> getAirtableCategoriesDio(catName) async {

    final response = await Dio().get(
      'https://api.airtable.com/v0/$projectBase/$recordNameCategories',
      queryParameters: {
        'filterByFormula': 'SEARCH("$catName",{Name})'
        // Searches the value 'Cactus' in the 'Short description' field.
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Accept': 'Application/json',
        },
      ),
    );


    final categoryInfo = CategoryDio.fromJson(response.data);
    return categoryInfo.records.first.fields.numberOfTasks;
  }


}

getOrCreateUserProgress(catName) async {

  var currentQuestion = 1;
  final currenUser = FirebaseAuth.instance.currentUser!.email.toString();

  final response = await Dio().get(
    'https://api.airtable.com/v0/$projectBase/$recordNameCurrentProgress',
    queryParameters: {
      'filterByFormula': 'SEARCH("$catName",{Category})'
      // Searches the value 'Cactus' in the 'Short description' field.
    },
    options: Options(
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Accept': 'Application/json',
      },
    ),
  );

  final curProgress = CurrentProgress.fromJson(response.data);

  if (curProgress.records.isNotEmpty) {
    curProgress.records.forEach((value) {

      if (value.fields.user == currenUser) {
        currentQuestion = value.fields.question;
      }
    });
  } else {
    final response = await Dio().post(
      'https://api.airtable.com/v0/$projectBase/$recordNameCurrentProgress',
      options: Options(
        contentType: 'Application/json',
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Accept': 'Application/json',
        },
      ),
      data: {
        'records': [
          {
            'fields': {
              'User': '$currenUser',
              'Question': 1,
              'Category': '$catName',
            }
          },
        ],
      },
    );
  }
  return currentQuestion;
}


