---
layout: page
permalink: /news/
title: news
description:
nav: true
nav_order: 3
---

<div class="news">
	{% if site.news != blank -%} 
		{%- assign news_size = site.news | size -%}
		<div class="table-responsive" {% if site.news_scrollable and news_size > 3 %}style="max-height: 10vw"{% endif %}>
			<table class="table table-sm table-borderless">
			{%- assign news = site.news | reverse -%}
			{% if site.news_limit_page %}
			{% assign news_limit_page = site.news_limit_page %}
			{% else %}
			{% assign news_limit_page = news_size %}
			{% endif %}
			{% for item in news limit: news_limit_page %} 
			<tr>
				<th scope="row" width="11%">{{ item.date | date: "%b %-d, %Y" }}</th>
				<td>
				{% if item.inline -%} 
				{{ item.content | remove: '<p>' | remove: '</p>' | emojify }}
				{%- else -%} 
				<a class="news-title" href="{{ item.url | relative_url }}">{{ item.title }}</a>
				{%- endif %} 
				</td>
			</tr>
			{%- endfor %} 
			</table>
		</div>
	{%- else -%} 
		<p>No news so far...</p>
	{%- endif %} 
</div>