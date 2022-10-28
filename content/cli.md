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
cd /home/fred/hugo/conten/recipes
csplit --suppress-matched -f "macaron-" -b "%02d.da.md" /home/fred/.repo/traductions/recettes/source/macaron_da.md '/-----/' '{*}'
csplit --suppress-matched -f "macaron-" -b "%02d.en.md" /home/fred/.repo/traductions/recettes/target/macaron_da_en.md '/-----/' '{*}'
```

### remove front matter from a mardown file
https://sed.js.org/index.html?gist=dd5b501657bdc24b18835d618746e8c0

```bash

sed -i '1{/^---$/!q;};1,/^---$/d'  macaron-00.da.md
sed -i '1{/^---$/!q;};1,/^---$/d'  macaron-00.en.md

```

### add front matter to all mardown file "*da.md"

```bash

find -name "macaron*.da.md" -exec bash -c ' cat "{}"| cat da.yml - |tee "{}" ' \;
find -name "macaron*.en.md" -exec bash -c ' cat "{}"| cat en.yml - |tee "{}" ' \;

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
