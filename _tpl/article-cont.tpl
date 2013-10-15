<!-- MAIN ARTICLE -->
<article class="main-article single">                                    
    {{ if $gimme->article->content_accessible }} 
        <header>
            <time datetime="{{$gimme->article->publish_date|date_format:"%Y-%m-%dT%H:%MZ"}}">{{ $gimme->article->publish_date|camp_date_format:"%d %M %Y" }}</time>
            {{ if $gimme->article->type_name == "news" }}
            <a href="#comments"  class="news-section-comments">
            <span aria-hidden="true" class="icon-bubble"></span>
                {{ if $gimme->article->comment_count == 1 }}
                    {{ $gimme->article->comment_count }} {{ #comment# }}
                {{ else }}
                    {{ $gimme->article->comment_count }} {{ #comments# }}
                {{ /if }}
            </a>
            {{ /if }}
            <h2 class="hl-alpha">{{ $gimme->article->name }}</h2>
            {{ if $gimme->article->type_name == "news" }}
                
                <p>{{ #By# }} 
                {{ list_article_authors }} 
                    {{ if $gimme->author->user->defined}}
                        <a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">
                    {{/if}}
                    {{ $gimme->author->name }}
                    {{if $gimme->author->user->defined }}
                        </a>
                    {{/if}} 
                    <small>({{ $gimme->author->type }})</small>
                    {{ if !$gimme->current_list->at_end }}
                        , 
                    {{/if}}
                {{/list_article_authors}}
                </p>
                {{ if !$gimme->article->has_map }}
                <p><span aria-hidden="true" class="icon-location"></span> {{ #locations# }}: 

                {{ list_article_locations }}

                    {{ if $gimme->location->enabled }}
                        {{ $gimme->location->name }}
                        {{ if $gimme->current_list->at_end }}
                        {{ else }}
                            ,
                        {{ /if }}
                    {{ /if }}

                {{ /list_article_locations }}

                </p> 
                {{/if}}
                <p>
                {{ list_article_topics }}
                    {{ if $gimme->current_list->at_beginning }}
                        <span aria-hidden="true" class="icon-tags"></span> {{ #topics# }} 
                    {{ /if }}
                    <a href="{{ url options="template topic.tpl" }}">{{ $gimme->topic->name }}</a>
                    {{ if $gimme->current_list->at_end }}
   
                    {{ else }}
                        , 
                    {{ /if }}
                {{ /list_article_topics }}
                </p>
            {{ /if }}
        </header>
        {{ if $gimme->article->type_name == "news" }}
            {{ include file="_tpl/img/img_slider.tpl"}}
        {{ /if }}

        {{ include file="_tpl/_edit-article.tpl" }}
        <div class="article-fulltext">
            {{ $gimme->article->full_text }}
        </div>
        <ul class="article-social">
            <li>
                <a href="https://twitter.com/share" class="twitter-share-button" data-dnt="true">Tweet</a>
            </li>

            <li>
                <div id="fb-root"></div>
                <fb:like href="http://{{ $gimme->publication->site }}{{ uri }}" send="false" layout="button_count" show_faces="false"></fb:like>
            </li>
    
            <li>
                <div class="g-plusone" data-size="medium" data-annotation="inline" data-width="120"></div>
            </li>
            
        </ul>
        {{ include file="_tpl/article-related.tpl"}}
        {{ include file="_tpl/article-attachments.tpl"}}

        {{ if $gimme->article->type_name == "news" }}

            {{ include file="_tpl/article-rating.tpl" }}

            {{ include file="_tpl/article-comments.tpl" }}
        
        {{ /if }}

    {{ else }}
    <header>
        <h2 class="hl-alpha">{{ #infoOnLockedArticlesHeadline# }}</h2>
        <p class="info info-error">{{ #infoOnLockedArticles# }}</p>
    </header>
    {{ /if }}

</article>