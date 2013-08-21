<div class="news-sections">
{{ assign var=currentsection value=$gimme->section->number}}
	{{ if $currentsection }}
		{{ assign var=constraints value="number not $currentsection"}}
	{{ else }}
		{{ assign var=constraints value=""}}
	{{ /if }}
        
{{ list_sections constraints=$constraints columns="2"}}
	{{ if $gimme->current_list->column == "1" }}
		<div class="news-sections-inner news-sections-clear">
	{{ else }}
		<div class="news-sections-inner">
	{{ /if }}
		{{ if $gimme->section->name != "Dialogue" }}
			<h2>{{ $gimme->section->name}}</h2>
			{{ list_articles length="3" order="byPublishDate desc" }}
			<div class="news-sections-inner-alpha">
				<time datetime="{{ $gimme->article->publish_date|date_format:"%Y-%m-%dT%H:%MZ" }}">{{ $gimme->article->publish_date|camp_date_format:"%M %e, %Y" }}</time>
				{{ if $gimme->article->comment_count > 0 }}
				<a href="{{ uri option='article'}}#comments" class="news-section-comments">
				<span aria-hidden="true" class="icon-bubble"></span>
					{{ if $gimme->article->comment_count == 1 }}
						{{ $gimme->article->comment_count }} <span class="acc">{{ #comment# }}</span>
					{{ else }}
						{{ $gimme->article->comment_count }} <span class="acc">{{ #comments# }}</span>
					{{ /if }}
				</a>
				{{ /if }}
		        <h3><a href="{{ uri option='article'}}">{{ $gimme->article->name }}</a></h3>
		        {{ include file="_tpl/img/img_thumb.tpl" }}
		        {{ $gimme->article->full_text|truncate:100:"...":true }}
		        <a class="link-more" href="{{ uri options="article" }}">{{ #readMore# }}</a>
		    </div>
	   	 	{{ /list_articles }}
	   	{{ /if }}
	</div>
{{/list_sections}}
</div><!-- end section-stories.tpl -->