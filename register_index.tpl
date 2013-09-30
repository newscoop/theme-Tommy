{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include file="_tpl/_html-head.tpl" }}

<body>
<!--[if lt IE 7]>
    <p class="chromeframe">{{ #outdatedBrowser# }}</p>
<![endif]-->
 
{{ include file="_tpl/header.tpl" }}
<main role="main" class="main site-register">
    <section class="main-alpha">
        <h1>{{ #register# }}</h1>
        <div class="form-register">
            {{ $form }}
        </div>
    </section> 
    <aside class="main-beta clearfix" role="complementary">
        {{ include file="_tpl/user-sidebar.tpl" }}          
    </aside>
</main>

{{ include file="_tpl/footer.tpl" }}
<script>
    $('.form-register #email').change(function() {
        $.post('{{ $view->url(['controller' => 'register', 'action' => 'check-email'], 'default') }}?format=json', {
            'email': $(this).val()
        }, function (data) {
            if (data.status) {
                $('.form-register #email').css('color', 'green');
            } else {
                $('.form-register #email').css('color', 'red');
            }
        }, 'json');
    }).keyup(function() {
        $(this).change();
    });
</script>
{{ include file="_tpl/_html-foot.tpl" }}

