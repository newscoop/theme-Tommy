{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include file="_tpl/_html-head.tpl" }}

<body>
<!--[if lt IE 7]>
    <p class="chromeframe">{{ #outdatedBrowser# }}</p>
<![endif]-->
          
{{ include file="_tpl/header.tpl" }}

<main role="main" class="main site-section">
    <section class="main-alpha">
        <h1>{{ #searchResults# }}</h1>

        {{ include file="_tpl/search-cont.tpl" }}
    </section>
    <aside class="main-beta clearfix">
        {{ include file="_tpl/multimedia.tpl" }}
        {{ include file="_tpl/front-sidebar.tpl" }}
        {{ include file="_tpl/sidebar_poll.tpl" }}
        {{ include file="_tpl/sidebar_comments.tpl" }}
    </aside>
</main>

{{ include file="_tpl/footer.tpl" }}

{{ include file="_tpl/_html-foot.tpl" }}
