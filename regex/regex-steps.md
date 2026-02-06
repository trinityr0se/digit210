# Regex Exercise 1 – Movie Data

Tool: oXygen XML Editor
Source file: movieData.txt
Result file: movieData.xml

Text
## Step 1: Escape ampersands

Find:
&


Replace:
&amp;


---

## Step 2: Escape less-than signs

Find:
<


Replace:
&lt;

---

## Step 3: Escape greater-than signs
Find:
>
Replace:
&gt;
---

## Step 4: Wrap each line in a <movie> element
Find:
^(.+)$
Replace:
<movie>\1</movie>

---

## Step 5: Seperate it out 

Find: <movie>(.+)\t(\d{4})\t(.+)\t(\d+)\smin</movie>


Replace: <movie>
<title>\1</title>
<date>\2</date>
<location>\3</location>
<time unit="min">\4</time>
</movie>

---

## Step 6: Fix the movie spacing 
find: </movie><movie>

replace:  </movie>
<movie>

---

## step 7:  N/A time

find: <movie>(.+)\t(\d{4})\t(.+)\tN/A</movie> 

replace: <movie>
<title>\1</title>
<date>\2</date>
<location>\3</location>
<time unit="min">N/A</time>
</movie>

---

## step 8: wrap it in a root element

find: \A([\s\S]*)\z


replace: <movies>
\1
</movies>



