{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include file="_tpl/_html-head.tpl" }}

<body id="body">
<!--[if lt IE 7]>
    <p class="chromeframe">{{ #outdatedBrowser# }}</p>
<![endif]-->
          
{{ include file="_tpl/header.tpl" }}

<main role="main" class="main site-archive">
    <section class="main-alpha">
        <h1>{{ #welcome# }} {{ $user->name }} <a class="user-edit-link" href='{{ $view->url(['username' => $gimme->user->uname], 'user') }}'>{{ #show# }} {{ #profile# }}</a></h1>
        <img alt="{{ #profilePicture# }} {{ #from# }} {{ $user->name }}" src="{{ include file="_tpl/user-image.tpl" user=$user width=140 height=210 }}" />
        <div class="form-user">
            {{ $form }}
        </div>
    </section>
    <aside class="main-beta clearfix">
        {{ include file="_tpl/user-sidebar.tpl" }}
    </aside>
</main> <!-- end main role main -->

{{ include file="_tpl/footer.tpl" }}

{{ include file="_tpl/_html-foot.tpl" }}