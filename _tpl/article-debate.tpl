<!-- MAIN ARTICLE -->
<article class="main-article single debate">                                    
    {{ if $gimme->article->content_accessible }} 
        <header>
            <time datetime="{{$gimme->article->publish_date|date_format:"%Y-%m-%dT%H:%MZ"}}">{{ $gimme->article->publish_date|camp_date_format:"%d %M %Y" }}</time>
            <a href="#comments" class="news-section-comments">
                {{ if $gimme->article->comment_count == 1 }}
                    {{ $gimme->article->comment_count }} {{ #comment# }}
                {{ else }}
                    {{ $gimme->article->comment_count }} {{ #comments# }}
                {{ /if }}
            </a>
            <h1>{{ $gimme->article->name }}</h1>
            <p>{{ #By# }}
                {{ list_article_authors }} 
                    {{ if $gimme->author->user->defined}}<a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}" class="link-color">{{/if}}{{ $gimme->author->name }}{{if $gimme->author->user->defined }}</a>{{/if}} ({{ $gimme->author->type|lower }}) {{ if !$gimme->current_list->at_end }}, {{/if}}
                {{/list_article_authors}}
            </p>
            {{ if $gimme->article->has_map }}
                <p>{{ #locations# }}: {{ list_article_locations }}{{ if $gimme->location->enabled }}{{ $gimme->location->name }}{{ if $gimme->current_list->at_end }}{{ else }}, {{ /if }}{{ /if }}{{ /list_article_locations }}</p> 
            {{/if}}
        </header>

        <section class="article-content">

            {{ include file="_tpl/_edit-article.tpl" }}

            <p>{{ $gimme->article->teaser }}</p>

            <div class="debate-right news-sections">

                <h2>PRO: {{ $gimme->article->pro_title }}</h2>
                                
                {{ list_article_authors }}
                    {{ if $gimme->current_list->index == "1"}}
                        <img alt="{{ $gimme->author->name }}" src="{{ $gimme->author->picture->imageurl }}" width=97 height=97 />
                        <h3>{{ #proArgumentsBy# }}</h3>
                        <p>{{ if $gimme->author->user->defined }}<a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}" class="link-color">{{ /if }}{{ $gimme->author->name }}{{ if $gimme->author->user->defined }}</a>{{ /if }}</p>
                        <p>{{ $gimme->author->biography->text|strip_tags:false|truncate:200 }}</p>
                    {{ /if }}

                {{ /list_article_authors }}

                {{ $gimme->article->pro_text }}
            </div>

            <div class="debate-left news-sections">
                <h2>CONTRA: {{ $gimme->article->contra_title }}</h2>
                {{ list_article_authors }}
                    {{ if $gimme->current_list->index == "2"}}
                        <img rel="resizable" alt="{{ $gimme->author->name }}" src="{{ $gimme->author->picture->imageurl }}" width=97 height=97 />
                        <h3>{{ #contraArgumentsBy# }}</h3>
                        <p>{{ if $gimme->author->user->defined }}<a class="link-color" href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">{{ /if }}{{ $gimme->author->name }}{{ if $gimme->author->user->defined }}</a>{{ /if }}</p>
                        <p>{{ $gimme->author->biography->text|strip_tags:false|truncate:200 }}</p>
                    {{ /if }}
                {{ /list_article_authors }}

                
                {{ $gimme->article->contra_text }}
            </div>
        </section>

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

        {{ include file="_tpl/article-comments.tpl" }}
        </section>
        {{ else }}
        <header>
            {{ #infoOnLockedArticles# }}
        </header>
        {{ /if }} {{* end content_accesible *}}
</article>