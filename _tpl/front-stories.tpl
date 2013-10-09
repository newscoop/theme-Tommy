<div class="news-featured" id="slider-front">
{{ list_playlist_articles name="Front page" length="4" }}
    <div class="news-featured-inner">
        <h2><a href="{{ uri option='article'}}">{{ $gimme->article->name }}</a></h2>
        <h3>{{ $gimme->section->name }}</h3>
        <a href="{{ uri option='article'}}">{{ include file="_tpl/img/img_slider.tpl" }}</a>
    </div>
{{ /list_playlist_articles }}
</div><!-- end front-stories.tpl -->