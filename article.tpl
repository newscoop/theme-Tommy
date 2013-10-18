{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include file="_tpl/_html-head.tpl" }}

<body id="body">
<!--[if lt IE 7]>
    <p class="chromeframe">{{ #outdatedBrowser# }}</p>
<![endif]-->
          
{{ include file="_tpl/header.tpl" }}

<main role="main" class="main site-article" id="main">
    <section class="main-alpha">
    {{ if $gimme->article->type_name == "debate" }}
        {{ include file="_tpl/article-debate.tpl" }}
    {{ else }}
        {{ include file="_tpl/article-cont.tpl" }}
    {{ /if }}
    </section>
    <aside class="main-beta clearfix" role="complementary">
        {{ if $gimme->article->type_name == "debate" }}
            {{ include file="_tpl/sidebar_comments.tpl" }}
            {{ include file="_tpl/debate-voting.tpl" }}
        {{ /if }}
        {{ if $gimme->article->type_name == "news" }}
            {{ include file="_tpl/article-slideshows.tpl" }}
            {{ include file="_tpl/sidebar_comments.tpl" }}
        {{ /if }}
        
        {{ include file="_tpl/sidebar_ad.tpl" }}
    </aside>
</main>

{{ include file="_tpl/footer.tpl" }}

{{ include file="_tpl/_html-foot.tpl" }}

