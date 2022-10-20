---
Description: speciality from sweden
Genre: recettes
Lang: danish
Title: test page
author: fred
date: "2021-03-11"
hero: "03"
herosubtitle: Ceci est un subtitle
herotitle: Ceci est un test
menu:
  main:
    name: test
    parent: autre
    weight: 500
tags:
- brioche
- swedish
---

### emoji
 :smile:
 
 ### DATE
 a mettre dans une template
  <p class="date">{{ .Date | time.Format ":date_full"  }}</p>

### lang
{{< lang >}}

{{< figure src="/images/about.jpg"  >}}
{{< languages >}}

#### lang of this file


### attachments
{{%attachments title="Related files" pattern=".*\.(pdf|txt)$"/%}}

:smile:

### hint
{{% hint danger %}}
Example text that *may* contain **markdown** `markup`.
{{% /hint %}}



### TABS

{{< tabs >}}

{{< tab "INFOS" >}}
## INFOS

This is tab **INFOS** content.

:smile:
{{< /tab >}}
{{< tab "MORE" >}}
## MORE

This is tab **MORE** content.

![Kanelsnurrer](https://live.nemligstatic.com/scommerce/images/850x478_Kanelsnurrer-98003776.jpg?i=%7B4EBD7721-C82F-41A9-B498-263F0EFA9895%7D&v=gHW17WGg%27&w=1105&h=621&mode=crop%27)



{{< /tab >}}
{{< tab "LOCATION" >}}
## LOCATION

This is tab **Windows** content.

Lorem markdownum insigne. Olympo signis Delphis! Retexi Nereius nova develat
stringit, frustra Saturnius uteroque inter!


{{< /tab >}}
{{< /tabs >}}


# RSS
{{$showrss:=false }}
	<a href="{{ .Site.BaseURL }}">{{ .Site.BaseURL }}</a>
	{{- if .Param "showrss" }}
	<br><br><a href="/index.xml"><img src="/rss.svg" style="max-height:1.5em" alt="RSS Feed" title="Subscribe via RSS for updates."></a>
	{{ end }}

