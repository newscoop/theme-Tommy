<section class="news-sections">
    <h2>{{ #commentsBy# }} {{ $user->first_name}} {{ $user->last_name}}</h2>
    {{ list_user_comments user=$user->identifier order="bydate desc" length="20" }}
        <p>
        <time class="timeago" datetime="{{ $gimme->user_comment->submit_date}}">{{ $gimme->user_comment->submit_date }},</time> {{ #by# }}
        {{ if $gimme->user_comment->user->identifier }}
            <a class="link-color" href="http://{{ $gimme->publication->site }}/user/profile/{{ $gimme->user_comment->user->uname|urlencode }}">{{ $gimme->user_comment->user->uname }}</a>
        {{ else }}
            {{ $gimme->user_comment->nickname }} ({{ #anonymous# }})
        {{ /if }}
        </p>
       <a href="{{ $gimme->user_comment->article->url }}#comments">{{ $gimme->user_comment->content|escape|truncate:120 }}</a>
    {{ /list_user_comments }}

</section>