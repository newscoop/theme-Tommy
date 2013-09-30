{{ if $user->isAuthor() }}
{{ $escapedName=str_replace(" ", "\ ", $user->author->name) }}
{{/if}}
<section class="news-sections user-articles-list">
    <h2>{{ #articlesBy# }} {{ $user->first_name}} {{ $user->last_name}}</h2>
    {{ list_articles length="5" ignore_publication="true" ignore_issue="true" ignore_section="true" constraints="author is $escapedName type is news" order="bypublishdate desc" }}
        <article class="clearfix">
            
            <time datetime="{{$gimme->article->publish_date|date_format:"%Y-%m-%dT%H:%MZ"}}">{{ $gimme->article->publish_date|camp_date_format:"%d %M %Y" }}</time>
            {{ if $gimme->article->comment_count > 0 }}
                <a href="{{ uri option='article'}}#comments" class="news-section-comments">
                <span aria-hidden="true" class="icon-bubble"></span>
                    {{ if $gimme->article->comment_count == 1 }}
                        {{ $gimme->article->comment_count }} <span class="acc">{{ #comment# }} {{ #for# }} {{ $gimme->article->name }}</span>
                    {{ else }}
                        {{ $gimme->article->comment_count }} <span class="acc">{{ #comments# }} {{ #for# }} {{ $gimme->article->name }}</span>
                    {{ /if }}
                </a>
                {{ /if }}
            {{ if !$gimme->article->content_accessible }}
            <span class="label label-premium"><span aria-hidden="true" class="icon-lock"></span> {{ #premium# }}</span>
            {{ /if }}
            <h3><a href="{{ $gimme->article->url }}">{{ $gimme->article->name }}</a></h3>
            {{ include file='_tpl/img/img_thumb.tpl'}}
            {{ $gimme->article->full_text|truncate:100:"...":true }}
            <a class="link-more" href="{{ uri options="article" }}">{{ #readMore# }} <span class="acc">{{ #from# }} {{ $gimme->article->name }}</span></a>
            
           
        </article>

        {{ if $gimme->current_list->at_end }}            

        {{* PAGINATION *}}
        {{ $pages=ceil($gimme->current_list->count/5) }}
        {{ $curpage=intval($gimme->url->get_parameter($gimme->current_list_id())) }}
        {{ if $pages gt 1 }}
        <div class="pagination">
            <ul>
                {{ if $gimme->current_list->has_previous_elements }}<li class="prev"><a rel="prev" href="{{ $view->url(['username' => $user->uname], 'user') }}?{{ urlparameters options="previous_items" }}">&laquo;</a></li>{{ /if }}
                {{ for $i=0 to $pages - 1 }}
                    {{ $curlistid=$i*5 }}
                    {{ $gimme->url->set_parameter($gimme->current_list_id(),$curlistid) }}
                    {{ if $curlistid != $curpage }}
                <li><a href="{{ $view->url(['username' => $user->uname], 'user') }}?{{ urlparameters }}">{{ $i+1 }}</a></li>
                    {{ else }}
                <li class="active disable"><a href="{{ $view->url(['username' => $user->uname], 'user') }}?{{ urlparameters }}">{{ $i+1 }}</a></li>
                    {{ $remi=$i+1 }}
                    {{ /if }}
                {{ /for }}
                {{ if $gimme->current_list->has_next_elements }}<li class="next"><a rel="next" href="{{ $view->url(['username' => $user->uname], 'user') }}?{{ urlparameters options="next_items" }}">&raquo;</a></li>{{ /if }}
            </ul>
        </div>
        {{ $gimme->url->set_parameter($gimme->current_list_id(),$curpage) }}
        {{ /if }}

        {{ /if }}

        {{/list_articles}}
</section>