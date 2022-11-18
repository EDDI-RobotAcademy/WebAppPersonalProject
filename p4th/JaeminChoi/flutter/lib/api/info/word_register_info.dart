class WordRegisterInfo{
  final String word;
  final String meaning;
  final String synonym;
  final String antonym;
  final String example;
  final int degree;

  WordRegisterInfo(this.word, this.meaning, this.synonym, this.antonym, this.example, this.degree);

  Map<String, dynamic> toJson() => {
    'word' : word,
    'meaning' : meaning,
    'synonym' : synonym,
    'antonym' : antonym,
    'example' : example,
    'degree' : degree,
  };
}