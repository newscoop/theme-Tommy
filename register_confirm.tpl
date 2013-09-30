{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include file="_tpl/_html-head.tpl" }}

<body>
<!--[if lt IE 7]>
    <p class="chromeframe">{{ #outdatedBrowser# }}</p>
<![endif]-->
 
{{ include file="_tpl/header.tpl" }}
<main role="main" class="main site-register">
    <section class="main-alpha">
        <h1>{{ #pleaseFillYourData# }}</h1>
        <div class="form-user">
        {{ $form }}
        </div>
    </section> 
    <aside class="main-beta clearfix" role="complementary">
        {{ include file="_tpl/user-sidebar.tpl" }}          
    </aside>
</main> 


{{ include file="_tpl/footer.tpl" }}
<script>
    $('#first_name, #last_name').keyup(function() {
        $.post('{{ $view->url(['controller' => 'register', 'action' => 'generate-username'], 'default') }}?format=json', {
            'first_name': $('#first_name').val(),
            'last_name': $('#last_name').val()
        }, function (data) {
            $('#username').val(data.username).css('color', 'green');
        }, 'json');
    });

    $('#username').change(function() {
        $.post('{{ $view->url(['controller' => 'register', 'action' => 'check-username'], 'default') }}?format=json', {
            'username': $(this).val()
        }, function (data) {
            if (data.status) {
                $('#username').css('color', 'green');
            } else {
                $('#username').css('color', 'red');
            }
        }, 'json');
    }).keyup(function() {
        $(this).change();
    });
</script>
{{ include file="_tpl/_html-foot.tpl" }}

