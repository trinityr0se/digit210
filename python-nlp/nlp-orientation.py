import nltk
from nltk.tokenize import word_tokenize

with open("sample.txt", "r") as file:
    text = file.read()

words = word_tokenize(text)

print("Words in your text:")
print(words)

print("\nTotal word count:")
print(len(words))