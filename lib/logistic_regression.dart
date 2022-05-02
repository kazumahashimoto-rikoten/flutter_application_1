import 'package:flutter/services.dart' show rootBundle;
import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:ml_preprocessing/ml_preprocessing.dart';
// to access local path
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

void hoge() async {
  final rawCsvContent = await rootBundle
      .loadString('assets/datasets/pima_indians_diabetes_database.csv');
  final samples = DataFrame.fromRawCsv(rawCsvContent);
  // print(samples.rows);
  // final targetColumnName = 'class variable (0 or 1)';
  final targetColumnName = 'Outcome';
  final splits = splitData(samples, [0.7]);
  final validationData = splits[0];
  final testData = splits[1];
  final validator = CrossValidator.kFold(validationData, numberOfFolds: 5);
  final createClassifier = (DataFrame samples) => LogisticRegressor(
        samples,
        targetColumnName,
        optimizerType: LinearOptimizerType.gradient,
        iterationsLimit: 90,
        learningRateType: LearningRateType.timeBased,
        batchSize: samples.rows.length,
        probabilityThreshold: 0.7,
      );
  final scores =
      await validator.evaluate(createClassifier, MetricType.accuracy);
  final accuracy = scores.mean();

  print('accuracy on k fold validation: ${accuracy.toStringAsFixed(2)}');

  final testSplits = splitData(testData, [0.8]);
  final classifier = createClassifier(testSplits[0]);
  final finalScore = classifier.assess(testSplits[1], MetricType.accuracy);

  print(finalScore.toStringAsFixed(2));

  final path = await _localPath; //ファイルパス用意
  print(path);

  await classifier.saveAsJson('$path/diabetes_classifier.json');

  final fileName = '$path/diabetes_classifier.json';
  final file = File(fileName);
  final encodedModel = await file.readAsString();
  final classifier_2 = LogisticRegressor.fromJson(encodedModel);
  // final unlabelledData = await fromCsv('some_unlabelled_data.csv');
  final hoge = <Iterable>[
    [
      'Pregnancies',
      'Glucose',
      'BloodPressure',
      'SkinThickness',
      'Insulin',
      'BMI',
      'DiabetesPedigreeFunction',
      'Age'
    ],
    [1, 189, 60, 23, 846, 30.1, 0.398, 59],
    [5, 166, 72, 19, 175, 25.8, 0.587, 51],
    [7, 100, 0, 0, 0, 30, 0.484, 32],
    [0, 118, 84, 47, 230, 45.8, 0.551, 31],
    [7, 107, 74, 0, 0, 29.6, 0.254, 31],
    [1, 103, 30, 38, 83, 43.3, 0.183, 33],
    [1, 115, 70, 30, 96, 34.6, 0.529, 32],
    [3, 126, 88, 41, 235, 39.3, 0.704, 27],
    [8, 99, 84, 0, 0, 35.4, 0.388, 50]
  ];
  final data = DataFrame(hoge);
  final prediction = classifier_2.predict(data);
  print(data.header);
  print(prediction.header); // ('class variable (0 or 1)')
  print(prediction.rows);
}
