{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include file="_tpl/_html-head.tpl" }}

<body id="body">
<!--[if lt IE 7]>
    <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->
          
{{ include file="_tpl/header.tpl" }}

<main role="main" class="main site-front" id="main">
    <div class="main-alpha">
    {{ include file="_tpl/front-stories.tpl" }}
    {{ include file="_tpl/section-stories.tpl" }}
    </div>
    <div class="main-beta clearfix">
        {{ include file="_tpl/multimedia.tpl" }}
        {{ include file="_tpl/sidebar_ad.tpl" }}
        {{ include file="_tpl/sidebar_poll.tpl" }}
        {{ include file="_tpl/sidebar_comments.tpl" }}
    </div>
</main> <!-- end main role main -->

{{ include file="_tpl/footer.tpl" }}

{{ include file="_tpl/_html-foot.tpl" }}
