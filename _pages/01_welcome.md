---
layout: page
title: Welcome
permalink: /welcome/
---

![phylogeny of sampled strains]


<div class="home">

  <h2 class="page-heading">News</h2>

  <ul class="posts">

        {% for post in site.posts %}
	    <time>{{ post.date | date: "%b %-d, %Y" }}</time>
	        <h3><a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a></h3>
		      {{ post.content }}
		    {% endfor %}

  </ul>

  <p class="rss-subscribe">subscribe <a href="{{ "/feed.xml" | prepend: site.baseurl }}">via RSS</a></p>

</div>


[phylogeny of sampled strains]: {{ site.url }}{{ site.baseurl }}/assets/phylogeny_for_website.png "The phylogeny of the 12 sampled strains"