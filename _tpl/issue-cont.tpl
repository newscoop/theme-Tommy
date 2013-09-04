{{ list_sections }}  
    {{ list_articles }}
    {{ if $gimme->current_articles_list->at_beginning }}
        <section>
            <h1>{{ $gimme->section->name}}</h1>
    {{ /if }}    
           <article class="news-sections clearfix">
                <h2><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h2>
                {{ include file='_tpl/img/img_thumb.tpl' }}
                <p>{{ #publishedOn# }} 
                    <time datetime="{{ $gimme->issue->publish_date|date_format:"%Y-%m-%dT%H:%MZ" }}">{{ $gimme->issue->publish_date|camp_date_format:"%d %M %Y" }}</time>
                    <a href="{{ uri option='article'}}#comments" class="news-section-comments">
                    <span aria-hidden="true" class="icon-bubble"></span>
                        {{ if $gimme->article->comment_count == 1 }}
                            {{ $gimme->article->comment_count }} <span class="acc">{{ #comment# }}</span>
                        {{ else }}
                            {{ $gimme->article->comment_count }} <span class="acc">{{ #comments# }}</span>
                        {{ /if }}
                    </a>
                </p>
                {{ $gimme->article->full_text|truncate:130:"...":true }}
            </article>
    {{ if $gimme->current_articles_list->at_end }}
        </section>
    {{ /if }}
    {{ /list_articles }}    
{{ /list_sections }}