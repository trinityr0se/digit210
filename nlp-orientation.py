import nltk
from nltk.tokenize import word_tokenize
from nltk import FreqDist
from nltk.text import Text

with open("sample.txt") as f:
    text = f.read()

tokens = word_tokenize(text)

print("Words in your text:")
print(tokens)

print("\nTotal word count:")
print(len(tokens))

fdist = FreqDist(tokens)
print("\nMost common words:")
print(fdist.most_common(5))

lexical_diversity = len(set(tokens)) / len(tokens)
print("\nLexical diversity:")
print(lexical_diversity)

text_obj = Text(tokens)
print("\nWords similar to 'time':")
text_obj.similar("time")