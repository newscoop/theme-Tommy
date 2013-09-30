{{ list_articles length="5" ignore_issue="true" constraints="type not poll" order="byPublishDate desc"}}
    <article class="news-sections clearfix">

        <time datetime="{{ $gimme->article->publish_date|date_format:"%Y-%m-%dT%H:%MZ" }}">{{ $gimme->article->publish_date|camp_date_format:"%M %e, %Y" }}</time>
        {{ if $gimme->article->comment_count > 0 }}
        <a href="{{ uri option='article'}}#comments" class="news-section-comments">
        <span aria-hidden="true" class="icon-bubble"></span>
            {{ if $gimme->article->comment_count == 1 }}
                {{ $gimme->article->comment_count }} <span class="acc">{{ #comment# }} {{ #for# }} {{ $gimme->article->name }}</span>
            {{ else }}
                {{ $gimme->article->comment_count }} <span class="acc">{{ #comments# }} {{ #for# }} {{ $gimme->article->name }}</span>
            {{ /if }}
        </a>
        {{ else }}
            
        {{ /if }}
        {{ if !$gimme->article->content_accessible }}
        <span class="label label-premium"><span aria-hidden="true" class="icon-lock"></span> {{ #premium# }}</span>
        {{ /if }}
        <h3><a href="{{ uri option='article'}}">{{ $gimme->article->name }}</a> </h3>
        <span class="article-author">{{ #By# }}
        {{ list_article_authors }}
            {{ if $gimme->author->type == "Author" }}
                {{ if $gimme->author->user->defined}}
                    <a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">
                {{/if}}
                {{ $gimme->author->name }}
                {{if $gimme->author->user->defined }}
                    </a>
                {{/if}} 
                {{ if !$gimme->current_list->at_end }}
                    , 
                {{/if}}
            {{ /if }}
        {{/list_article_authors}}
        </span>                                  
        <a href="{{ uri options="article" }}">
         {{ if $gimme->current_list->at_beginning }}
            <div class="img-big">{{ include file="_tpl/img/img_slider.tpl" }}</div>
        {{ else }}
            {{ include file="_tpl/img/img_rectangle.tpl" }}
        {{ /if }}
        </a>
        {{ $gimme->article->full_text|truncate:420:"...":true }}
        <a class="link-more" href="{{ uri options="article" }}">{{ #readMore# }} <span class="acc">{{ #from# }} {{ $gimme->article->name }}</span></a>  
    </article>

    {{ if $gimme->current_list->at_end }}            

    {{* PAGINATION *}}
    {{ $pages=ceil($gimme->current_list->count/5) }}
    {{ $curpage=intval($gimme->url->get_parameter($gimme->current_list_id())) }}
    {{ if $pages gt 1 }}
    <div class="pagination">
        <ul>
            {{ if $gimme->current_list->has_previous_elements }}<li class="pagination-prev"><a rel="prev" href="{{ uripath options="section" }}?{{ urlparameters options="previous_items" }}">&laquo;</a></li>{{ /if }}
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
            {{ if $gimme->current_list->has_next_elements }}<li class="pagination-next"><a rel="next" href="{{ uripath options="section" }}?{{ urlparameters options="next_items" }}">&raquo;</a></li>{{ /if }}
        </ul>
    </div>
    {{ $gimme->url->set_parameter($gimme->current_list_id(),$curpage) }}
    {{ /if }}

    {{ /if }}

{{ /list_articles }}   