{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include file="_tpl/_html-head.tpl" }}

<body id="body">
<!--[if lt IE 7]>
    <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->
          
{{ include file="_tpl/header.tpl" }}

<main role="main" class="site-section">
    
    <div class="main-alpha">
    <h1>{{ $gimme->section->name }}</h1>

    {{ include file="_tpl/section-cont.tpl" }}
    </div>
    <div class="main-beta clearfix">
        {{ include file="_tpl/section-sidebar.tpl" }}
    </div>                                          
</main>

{{ include file="_tpl/footer.tpl" }}

{{ include file="_tpl/_html-foot.tpl" }}
