{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include file="_tpl/_html-head.tpl" }}

<body id="body">
<!--[if lt IE 7]>
    <p class="chromeframe">{{ #outdatedBrowser# }}</p>
<![endif]-->
          
{{ include file="_tpl/header.tpl" }}

<main role="main" class="main site-front" id="main">
    <section class="main-alpha">
    {{ include file="_tpl/front-stories.tpl" }}
    {{ include file="_tpl/section-stories.tpl" }}
    </section>
    <aside class="main-beta clearfix" role="complementary">
        {{ include file="_tpl/multimedia.tpl" }}
        {{ include file="_tpl/sidebar_ad.tpl" }}
        {{ include file="_tpl/sidebar_poll.tpl" }}
        {{ include file="_tpl/sidebar_comments.tpl" }}
    </aside>
</main> <!-- end main role main -->

{{ include file="_tpl/footer.tpl" }}

{{ include file="_tpl/_html-foot.tpl" }}
