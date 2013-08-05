<div class="news-sections box-comments">
    <h2>Latest Comments</h2>
    {{list_article_comments length="3" ignore_article="true" order="byDate desc"}}
        {{if $gimme->comment->content }}
        <h3><a href="{{uri}}#comments">{{$gimme->comment->content|truncate:120}}</a></h3>
        <p><time class="timeago link-color" datetime="{{ $gimme->comment->submit_date}}">{{ $gimme->comment->submit_date }},</time> {{ #by# }}
            {{ if $gimme->comment->user->identifier }}
                <a href="http://{{ $gimme->publication->site }}/user/profile/{{ $gimme->comment->user->uname|urlencode }}">{{ $gimme->comment->user->uname }}</a>
            {{ else }}
                {{ $gimme->comment->nickname }} ({{ #anonymous# }})
            {{ /if }}
        </p>
        {{/if}}
    {{ /list_article_comments }}
</div>