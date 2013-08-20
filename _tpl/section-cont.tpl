{{ list_articles length="5" ignore_issue="true" constraints="type not poll" order="byPublishDate desc"}}
    {{ if $gimme->current_list->at_beginning }}            

    <article class="news-featured news-sections clearfix">
        
        <h2><a href="{{ uri option='article'}}">{{ $gimme->article->name }}</a></h2>
        <time datetime="{{ $gimme->article->publish_date|date_format:"%Y-%m-%dT%H:%MZ" }}">{{ $gimme->article->publish_date|camp_date_format:"%M %e, %Y" }}</time>
        <a href="{{ uri option='article'}}#comments" class="news-section-comments">
        <span aria-hidden="true" class="icon-bubble"></span>
            {{ if $gimme->article->comment_count == 1 }}
                {{ $gimme->article->comment_count }} <span class="acc">{{ #comment# }}</span>
            {{ else }}
                {{ $gimme->article->comment_count }} <span class="acc">{{ #comments# }}</span>
            {{ /if }}
        </a>                                      
        <a href="{{ uri options="article" }}">
            {{ include file="_tpl/img/img_rectangle.tpl" }}
        </a>
        {{ if !$gimme->article->content_accessible }}
        <span class="info info-premium">{{ #premium# }}</span>
        {{ /if }}
        {{ $gimme->article->full_text|truncate:250:"...":true }}
        <a class="link-more" href="{{ uri options="article" }}">{{ #readMore# }}</a>                                  
    </article>
    {{ else }}

    <article class="news-sections clearfix">
        <h3><a href="{{ uri option='article'}}">{{ $gimme->article->name }}</a></h3>
        <time datetime="{{ $gimme->article->publish_date|date_format:"%Y-%m-%dT%H:%MZ" }}">{{ $gimme->article->publish_date|camp_date_format:"%M %e, %Y" }}</time>
        <a href="{{ uri option='article'}}#comments" class="news-section-comments">
        <span aria-hidden="true" class="icon-bubble"></span>
            {{ if $gimme->article->comment_count == 1 }}
                {{ $gimme->article->comment_count }} <span class="acc">{{ #comment# }}</span>
            {{ else }}
                {{ $gimme->article->comment_count }} <span class="acc">{{ #comments# }}</span>
            {{ /if }}
        </a>                                    
        <a href="{{ uri options="article" }}">
            {{ include file="_tpl/img/img_rectangle.tpl" }}
        </a>
        {{ if !$gimme->article->content_accessible }}
        <span class="info info-premium">{{ #premium# }}</span>
        {{ /if }}
        {{ $gimme->article->full_text|truncate:250:"...":true }}
        <a class="link-more" href="{{ uri options="article" }}">{{ #readMore# }}</a>  
    </article>
    {{ /if}}

    {{ if $gimme->current_list->at_end }}            

    {{* PAGINATION *}}
    {{ $pages=ceil($gimme->current_list->count/5) }}
    {{ $curpage=intval($gimme->url->get_parameter($gimme->current_list_id())) }}
    {{ if $pages gt 1 }}
    <div class="pagination">
        <ul>
            {{ if $gimme->current_list->has_previous_elements }}<li class="pagination-prev"><a href="{{ uripath options="section" }}?{{ urlparameters options="previous_items" }}">&laquo;</a></li>{{ /if }}
            {{ for $i=0 to $pages - 1 }}
                {{ $curlistid=$i*5 }}
                {{ $gimme->url->set_parameter($gimme->current_list_id(),$curlistid) }}
                {{ if $curlistid != $curpage }}
            <li><a href="{{ uripath options="section" }}?{{ urlparameters }}">{{ $i+1 }}</a></li>
                {{ else }}
            <li class="active"><a href="{{ uripath options="section" }}?{{ urlparameters }}">{{ $i+1 }}</a></li>
                {{ $remi=$i+1 }}
                {{ /if }}
            {{ /for }}
            {{ if $gimme->current_list->has_next_elements }}<li class="pagination-next"><a href="{{ uripath options="section" }}?{{ urlparameters options="next_items" }}">&raquo;</a></li>{{ /if }}
        </ul>
    </div>
    {{ $gimme->url->set_parameter($gimme->current_list_id(),$curpage) }}
    {{ /if }}

    {{ /if }}

{{ /list_articles }}   