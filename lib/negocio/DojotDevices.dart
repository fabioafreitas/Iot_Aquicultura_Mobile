import 'dart:math';

double doubleInRange(Random source, num start, num end) {
  num a = start - start * 0.5;
  num b = end + end * 0.5;
  return source.nextDouble() * (b - a) + a;
}

List<double> generateRandomValues(int size, num min, num max) {
  return new List<double>.generate(
    size,
    (i) => doubleInRange(
      DojotDevices.rng,
      min,
      max,
    ),
  );
}

List<String> generateTimeList(int size) {
  var time = DateTime.now().toUtc();
  List<String> lista = new List<String>.generate(size, (i) => 'a');
  for (var i = size - 1; i >= 0; i--) {
    lista[i] = time.toString();
    time = time.subtract(const Duration(seconds: 30));
  }
  return lista;
}

class DojotDevices {
  static int sizeLists = 20;
  static Random rng = Random();
  static var time = generateTimeList(sizeLists);
  static var temperature = [
    22.57818587851466,
    18.47556980524667,
    22.87654428756136,
    24.578030353464783,
    16.139368373901853,
    40.08152480674468,
    41.29851291595778,
    35.50813816103159,
    37.42811846937097,
    16.36541421688097,
    44.16729050720632,
    16.860306055733464,
    16.32312937921801,
    22.88999233849257,
    44.13838475069034,
    16.43917823656744,
    43.730906961374586,
    29.160181351220338,
    23.13207729900487,
    28.37491095235261
  ];
  static var ph = [
    11.789363833755118,
    11.472650358347195,
    7.998723771628061,
    4.557574343145127,
    3.08834443005526,
    3.5695788269468567,
    6.169343539490278,
    6.50250621500378,
    6.114679910255883,
    11.88852402290684,
    5.852716774581408,
    9.059830761564555,
    11.362704073477646,
    8.587675577223497,
    6.677188923729504,
    11.31746418976521,
    3.078645392042766,
    8.677380368017907,
    9.267339298449174,
    10.298572470931587
  ];
  static var conductivity = [
    55080.19507718108,
    23460.74465194185,
    51790.20480558216,
    22105.67953892351,
    32334.483950919,
    50852.54423199926,
    32787.91757044453,
    28030.191772643033,
    46018.13796305201,
    22751.9173490235,
    44343.74929466103,
    44426.938118342645,
    33738.314161329006,
    53412.73842715383,
    55476.17528332428,
    43692.385897361295,
    29848.05693595238,
    32511.969708861194,
    18099.378673468564,
    54190.30880669135
  ];
  static var oxygen = [
    9.770754481480134,
    11.133575840893704,
    6.593119409283466,
    3.0460312084877517,
    4.14023333515369,
    8.247686037197356,
    6.432674267025645,
    5.045741390802492,
    10.946198938099304,
    4.075469433231486,
    6.292859489709827,
    3.9101185797161726,
    6.647219677319952,
    3.7761978584928055,
    3.8190002534818355,
    7.894117407566909,
    5.365562597477426,
    6.925696767043048,
    5.505732068297078,
    10.49698779504604
  ];

  static var device_ids = [
    {
      'id': '35d9d3',
      'animal': 'shrimp',
    },
    {
      'id': '3b6eef',
      'animal': 'shrimp',
    },
    {
      'id': '3e8009',
      'animal': 'shrimp',
    },
    {
      'id': '42fedc',
      'animal': 'fish',
    },
    {
      'id': '4a0d44',
      'animal': 'fish',
    },
    {
      'id': '5ac0b2',
      'animal': 'fish',
    },
    {
      'id': '6691f',
      'animal': 'shrimp',
    },
    {
      'id': '690ec7',
      'animal': 'shrimp',
    },
    {
      'id': '77d02a',
      'animal': 'shrimp',
    },
    {
      'id': '828755',
      'animal': 'shrimp',
    },
    {
      'id': '88b7ef',
      'animal': 'fish',
    },
    {
      'id': '9aa64a',
      'animal': 'fish',
    },
    {
      'id': 'a23139',
      'animal': 'fish',
    },
    {
      'id': 'ad3d2c',
      'animal': 'fish',
    },
    {
      'id': 'beacdf',
      'animal': 'shrimp',
    },
    {
      'id': 'd1991b',
      'animal': 'shrimp',
    },
    {
      'id': 'd8deed',
      'animal': 'shrimp',
    },
    {
      'id': 'db7105',
      'animal': 'fish',
    },
    {
      'id': 'f13680',
      'animal': 'fish',
    },
    {
      'id': 'fe6042',
      'animal': 'shrimp',
    }
  ];
}
