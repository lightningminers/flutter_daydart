String addZero(String m){
  return int.parse(m) < 9 ? '0$m' : m;
}

Map<String, String> units = {
  'Y': 'year',
  'M': 'month',
  'W': 'week',
  'D': 'day',
  'H': 'hour',
  'MIN': 'minute',
  'S': 'second',
  'DATE': 'date',
  'MS': 'millisecond',
  'Q': 'quarter'
};