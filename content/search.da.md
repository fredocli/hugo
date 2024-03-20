---
title: Søg
slug: Søg
lang: danish
hero: "01"
featured_image: /images/01.jpg
layout: basic
menu:
  main:
    post: magnifying-glass
    weight: 100
---


<link href="/pagefind/pagefind-ui.css" rel="stylesheet">
<script src="/pagefind/pagefind-ui.js"></script>
<div id="search"></div>
<script>
    window.addEventListener('DOMContentLoaded', (event) => {
        new PagefindUI({ element: "#search",
         showSubResults: true ,
         showImages: false
        });
    });
</script>

