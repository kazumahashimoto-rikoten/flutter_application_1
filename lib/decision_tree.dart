import 'package:flutter/services.dart' show rootBundle;
import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:ml_preprocessing/ml_preprocessing.dart';

void decisionTree() async {
  final rawCsvContent = await rootBundle.loadString('assets/datasets/Iris.csv');
  final samples = DataFrame.fromRawCsv(rawCsvContent)
      .shuffle()
      .dropSeries(seriesNames: ['Id']);
  // final samples = (await fromCsv('assets/datasets/Iris.csv'))
  //     .shuffle()
  //     .dropSeries(seriesNames: ['Id']);

  final splits = splitData(samples, [0.7]);
  final validationData = splits[0];
  final testData = splits[1];

  final pipeline = Pipeline(samples, [
    encodeAsIntegerLabels(
      featureNames: [
        'Species'
      ], // Here we convert strings from 'Species' column into numbers
    ),
  ]);

  final numberOfFolds = 5;
  final processed = pipeline.process(samples);
  //
  // List name = [];
  // List index = [];
  // samples.rows.forEach((element) {
  //   String featureName = element.last;
  //   name.add(featureName);
  // });
  // processed.rows.forEach((element) {
  //   int featurenum = element.last;
  //   index.add(featurenum);
  // });
  // print(name);
  // print(index);

  var nameSet = <String>{};
  samples.rows.forEach((element) {
    String featureName = element.elementAt(4);
    nameSet.add(featureName);
  });
  var indexSet = <int>{};
  processed.rows.forEach((element) {
    int featurenum = element.elementAt(4);
    indexSet.add(featurenum);
  });

  print(nameSet);
  print(indexSet);

  var map = Map.fromIterable(
    indexSet,
    key: (v) => v,
    value: (v) => nameSet.elementAt(v),
  );
  print(map);

  //
  final validator = CrossValidator.kFold(
    processed,
    numberOfFolds: numberOfFolds,
  );

  final createClassifier = (DataFrame processed) => DecisionTreeClassifier(
        processed,
        'Species',
        minError: 0.3,
        minSamplesCount: 5,
        maxDepth: 4,
      );
  final classifier = DecisionTreeClassifier(
    processed,
    'Species',
    minError: 0.3,
    minSamplesCount: 5,
    maxDepth: 4,
  );

  final scores = await validator.evaluate(
    createClassifier,
    MetricType.accuracy,
  );

  final accuracy = scores.mean();

  print('accuracy on k fold validation: ${accuracy.toStringAsFixed(2)}');

  // final testSplits = splitData(testData, [0.8]);
  // final classifier = createClassifier(testSplits[0]);
  // final finalScore = classifier.assess(testSplits[1], MetricType.accuracy);

  // print(finalScore.toStringAsFixed(2));

  final data = <Iterable>[
    ['Id', 'SepalLengthCm', 'SepalWidthCm', 'PetalLengthCm', 'PetalWidthCm'],
    [1, 5.1, 3.5, 1.4, 0.2], //Iris-setosa
    // [2, 4.9, 3.0, 1.4, 0.2], //Iris-setosa
    // [3, 4.7, 3.2, 1.3, 0.2], //Iris-setosa
    // [4, 4.6, 3.1, 1.5, 0.2], //Iris-setosa
    // [5, 5.0, 3.6, 1.4, 0.2], //Iris-setosa
    [88, 6.3, 2.3, 4.4, 1.3], //Iris-versicolor
    // [109, 6.7, 2.5, 5.8, 1.8], //Iris-virginica
    [6, 5.4, 3.9, 1.7, 0.4], //Iris-setosa
  ];
  final testData2 = DataFrame(data);
  final prediction = classifier.predict(testData2);
  // testData.dropSeries(seriesNames: ['Species']);
  // final prediction =
  // classifier.predict(testData.dropSeries(seriesNames: ['Species']));

  // print(prediction.header);
  // prediction.rows.forEach((element) {
  //   print(element);
  // });
  print(prediction.toMatrix());
  final predictionP = classifier.predictProbabilities(testData2);
  print(predictionP.toMatrix());
}
