---
title: "recipes"
slug: recipes
layout: single  
menu:
  main:
    post: book
    weight: 100
featured_image: /bg/macaron2.jpg
featured_image_bg_color: bg-white-0

---

<div class="search js-only">
  <input type="text" id="search" placeholder="Search all recipes...">
  <button id="clear-search">
    <svg xmlns="http://www.w3.org/2000/svg" class="ionicon" viewBox="0 0 512 512"><title>Backspace</title><path d="M135.19 390.14a28.79 28.79 0 0021.68 9.86h246.26A29 29 0 00432 371.13V140.87A29 29 0 00403.13 112H156.87a28.84 28.84 0 00-21.67 9.84v0L46.33 256l88.86 134.11z" fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="32"></path><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M336.67 192.33L206.66 322.34M336.67 322.34L206.66 192.33M336.67 192.33L206.66 322.34M336.67 322.34L206.66 192.33"></path></svg>
  </button>
</div>

<script>

document.addEventListener("DOMContentLoaded", () => {
  for (e of document.getElementsByClassName("js-only")) {
    e.classList.remove("js-only");
  }

  const recipes = document.querySelectorAll("#articleList li");
  const search = document.getElementById("search");
  const clearSearch = document.getElementById("clear-search");
  const articleList = document.getElementById("articleList");

  search.addEventListener("input", () => {
    // grab search input value
    const searchText = search.value.toLowerCase().trim().normalize('NFD').replace(/\p{Diacritic}/gu, "");
    const searchTerms = searchText.split(" ");
    const hasFilter = searchText.length > 0;

    articleList.classList.toggle("list-searched", hasFilter);

    recipes.forEach(recipe => {
      const searchString = `${recipe.textContent} ${recipe.dataset.tags}`.toLowerCase().normalize('NFD').replace(/\p{Diacritic}/gu, "");
      const isMatch = searchTerms.every(term => searchString.includes(term));
      recipe.hidden = !isMatch;
      recipe.classList.toggle("matched-recipe", hasFilter && isMatch);
    })
  })

  clearSearch.addEventListener("click", () => {
    search.value = "";
    recipes.forEach(recipe => {
      recipe.hidden = false;
      recipe.classList.remove("matched-recipe");
    })

    articleList.classList.remove("list-searched");
  })
})

</script>

{{< articleList "recipes" >}}

## TAGS

{{< tagcloud >}}
