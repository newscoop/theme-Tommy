{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include file="_tpl/_html-head.tpl" }}

<body>
<!--[if lt IE 7]>
    <p class="chromeframe">{{ #outdatedBrowser# }}</p>
<![endif]-->
 
{{ include file="_tpl/header.tpl" }}
<main role="main" class="main site-pw">
    <section class="main-alpha">
        <h1>{{ #userAccount# }}</h1>
        <div class="info info-success">
            <h2><span aria-hidden="true" class="icon-checkmark-circle"></span> {{ #weSentYouAnEmail# }}</h2>
            <p>{{ #pleaseCheckYourInbox# }}</p>
        </div>
    </section>
    <aside class="main-beta clearfix">
        {{ include file="_tpl/user-sidebar.tpl" }}          
    </aside>
</div>

{{ include file="_tpl/footer.tpl" }}

{{ include file="_tpl/_html-foot.tpl" }}
