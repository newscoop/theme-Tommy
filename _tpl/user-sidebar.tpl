<!-- sidebar -->
<section class="news-sections user-feed">                                
    <h2>{{ #communityFeed# }}</h2>
    {{ local }}
    {{ set_current_issue }}
    {{ list_articles length="10" order="byLastComment desc" constraints="type is news" }}
        {{ list_article_comments length="1" order="bydate desc"}}
        <p><time datetime="{{ $gimme->comment->submit_date }}">{{ $gimme->comment->submit_date}}</time></p>
        <p>{{ #newCommentOn# }}</p>
        <a href="{{ uri options="article" }}"> {{ $gimme->article->name }}</a>
        {{ /list_article_comments }}
    {{ /list_articles }}
    {{ /local }}
</section>