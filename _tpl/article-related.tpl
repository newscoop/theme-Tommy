{{ list_related_articles }}
	{{ if $gimme->current_list->at_beginning }}
	<div class="news-sections news-article-related">
		<h2> {{ #relatedArticles# }}</h2>
    {{ /if }}
	{{ if $gimme->article->type_name == "news" }}
    	<h3><a href="{{ uri }}">{{ $gimme->article->name }}</a></h3>
    	{{ include file="_tpl/img/img_thumb.tpl" }}
    	{{ $gimme->article->full_text|truncate:220:"...":true }}
	{{ /if }}
    {{ if $gimme->current_list->at_end }}
    </div>
    {{ /if }}

{{ /list_related_articles }}