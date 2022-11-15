---
draft: true
---

### extract front matter
https://sed.js.org/index.html?gist=02a772935436567a48a13261c642d407

```bash

sed -n '1,/---/p' macaron_da.md > fm.txt

```

```yaml
---
title: opskrifter - macaron
genre: recettes
lang: danish
tags:
    -macaron
---
```

### split markdown file "macaron_da.md"
```bash
SECTION="macaron"
cd /home/fred/hugo/content/recipes/${SECTION}/
csplit --suppress-matched -f "${SECTION}-" -b "%02d.da.md" /home/fred/.repo/traductions/recettes/source/${SECTION}_da.md '/-----/' '{*}'
csplit --suppress-matched -f "${SECTION}-" -b "%02d.en.md" /home/fred/.repo/traductions/recettes/target/${SECTION}_da_en.md '/-----/' '{*}'

SECTION="wi"
cd /home/fred/hugo/content/recipes/${SECTION}/
csplit --suppress-matched -f "${SECTION}-" -b "%02d.da.md" /home/fred/.repo/traductions/recettes/source/${SECTION}_da.md '/-----/' '{*}'
csplit --suppress-matched -f "${SECTION}-" -b "%02d.en.md" /home/fred/.repo/traductions/recettes/target/${SECTION}_da_en.md '/-----/' '{*}'


SECTION="chokolader"
cd /home/fred/hugo/content/recipes/${SECTION}/
csplit --suppress-matched -f "${SECTION}-" -b "%02d.da.md" /home/fred/.repo/traductions/recettes/source/${SECTION}_da.md '/-----/' '{*}'
sed -i '1{/^---$/!q;};1,/^---$/d'  ${SECTION}-00.da.md

#csplit --suppress-matched -f "${SECTION}-" -b "%02d.en.md" /home/fred/.repo/traductions/recettes/target/${SECTION}_da_en.md '/-----/' '{*}'


```

### remove front matter from a mardown file

https://sed.js.org/index.html?gist=6602f5539ecb7ad5503d159e21e78e4a

```text
sed -i '1 { /^---/ { :a N; /\n---/! ba; d} }' INPUT_FILE
```





```text
1 {              # in the first line
  /^---/ {       # if it starts with ---
    :a           # jump label for looping
    N            # fetch the next line, append to pattern space
    /\n---/! ba; # if the result does not contain \n--- (that is, if the last
                 # fetched line does not begin with ---), go back to :a
    d            # then delete the whole thing.
  }
}
                 # otherwise drop off the end here and do the default (print
                 # the line)

```



### add front matter to all mardown file "*da.md"

```bash

find -name "${SECTION}*.da.md" -exec bash -c ' cat "{}"| cat da.yml - |tee "{}" ' \;
find -name "${SECTION}*.en.md" -exec bash -c ' cat "{}"| cat en.yml - |tee "{}" ' \;

```

```bash
frontmatter da
frontmatter en

```


# AUTRE
--front-matter="process"
yq --front-matter="process" about.da.md

```bash
yq --null-input '.hostname = env(HOSTNAME)'
```

 sed -n '1,/---/p' about.da.md| sed '1d;$d'|yq .Lang
 eval $( yq eval -N -op --front-matter="extract"  about.da.md |sed -e 's/=[^:\/\/]/="/g;s/$/"/g;s/ *=/=/g')
