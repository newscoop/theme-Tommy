{{ list_search_results length="5" order="bypublishdate desc" }}
    {{if $gimme->current_list->at_beginning}}
    <p>{{ $gimme->current_list->count }} {{ #resultsFor# }} <strong>{{ $gimme->search_articles_action->search_phrase }}</strong></p>
    {{/if}}
    {{ if $gimme->article->type_name == "news" }}
    <article class="news-sections">
        <time datetime="{{ $gimme->article->publish_date|date_format:"%Y-%m-%dT%H:%MZ" }}">{{ $gimme->article->publish_date|camp_date_format:"%M %e, %Y" }}</time>
        <a href="{{ uri option='article'}}#comments" class="news-section-comments">
        {{ if $gimme->article->comment_count == 1 }}
            {{ $gimme->article->comment_count }} {{ #comment# }}
        {{ else }}
            {{ $gimme->article->comment_count }} {{ #comments# }}
        {{ /if }}

        </a>
        <h2><a href="{{ uri options="article" }}">{{$gimme->article->name}}</a></h2>
        <a href="{{ uri options="article" }}">
            {{ include file="_tpl/img/img_130x70.tpl" }}
        </a>
        {{ if !$gimme->article->content_accessible }}
        <span class="label label-important normal-weight">{{ #premium# }}</span>
        {{ /if }}
        <p class="article-excerpt">
            {{ $gimme->article->deck }}
            <a class="link-more" href="{{ uri options="article" }}">{{ #readMore# }}</a>  
        </p>  
    </article>
    {{ /if }}
{{ if $gimme->current_list->at_end }}            

{{* PAGINATION *}}
{{ $pages=ceil($gimme->current_list->count/5) }}
{{ $curpage=intval($gimme->url->get_parameter($gimme->current_list_id())) }}
{{ if $pages gt 1 }}
<ul class="pagination">
    {{ if $gimme->current_list->has_previous_elements }}<li class="prev"><a href="{{ uripath options="section" }}?{{ urlparameters options="previous_items" }}">{{ #previous# }}</a></li>{{ /if }}
    {{ for $i=0 to $pages - 1 }}
        {{ $curlistid=$i*5 }}
        {{ $gimme->url->set_parameter($gimme->current_list_id(),$curlistid) }}
        {{ if $curlistid != $curpage }}
    <li><a href="{{ uripath options="section" }}?{{ urlparameters }}">{{ $i+1 }}</a></li>
        {{ else }}
    <li class="selected"><a href="{{ uripath options="section" }}?{{ urlparameters }}">{{ $i+1 }}</a></li>
        {{ $remi=$i+1 }}
        {{ /if }}
    {{ /for }}
    {{ if $gimme->current_list->has_next_elements }}<li class="next"><a href="{{ uripath options="section" }}?{{ urlparameters options="next_items" }}">{{ #next# }}</a></li>{{ /if }}
</ul>
{{ $gimme->url->set_parameter($gimme->current_list_id(),$curpage) }}
{{ /if }}

{{ /if }}

{{ /list_search_results }} 

{{ if $gimme->prev_list_empty }}
  <p>{{ #noResultsFound# }} <strong>"{{ $gimme->search_articles_action->search_phrase }}"</strong>.</p>
{{ /if }}
