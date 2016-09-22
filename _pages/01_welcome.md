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


Visitor Status


<a href="http://www.clustrmaps.com/map/Yjx1217.github.io/Yeast_PacBio_2016/welcome/" title="Visit tracker for Yjx1217.github.io/Yeast_PacBio_2016/welcome/"><img src="//www.clustrmaps.com/map_v2.png?u=RO8M&d=Z9QtnG6570n6G66XK09RXBchjpHRds0ZQ3ByHgiRd_I" /></a>

[phylogeny of sampled strains]: {{ site.url }}{{ site.baseurl }}/assets/phylogeny_for_website.png "The phylogeny of the 12 sampled strains"