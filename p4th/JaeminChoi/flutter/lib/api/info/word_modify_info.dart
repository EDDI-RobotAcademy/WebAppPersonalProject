class WordModifyInfo{
  final int wordId;
  final String word;
  final String meaning;
  final String synonym;
  final String antonym;
  final String example;

  WordModifyInfo(this.wordId ,this.word, this.meaning, this.synonym, this.antonym, this.example);

  Map<String, dynamic> toJson() => {
    'wordId' : wordId,
    'word' : word,
    'meaning' : meaning,
    'synonym' : synonym,
    'antonym' : antonym,
    'example' : example,
  };
}