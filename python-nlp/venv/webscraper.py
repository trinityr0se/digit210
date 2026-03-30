import os
import requests
from bs4 import BeautifulSoup

url = "https://mo-wright.github.io/vogue/reader.html"

response = requests.get(url)
response.raise_for_status()

soup = BeautifulSoup(response.text, "html.parser")

os.makedirs("output", exist_ok=True)

paragraphs = soup.find_all("p")

with open("output/vogue_text.txt", "w", encoding="utf-8") as f:
    for p in paragraphs:
        text = p.get_text(strip=True)
        if text:
            f.write(text + "\n\n")

print("Preview:\n")
for p in paragraphs[:5]:
    print(p.get_text(), "\n")

print("Done. Text saved to output/vogue_text.txt")