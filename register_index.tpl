{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include file="_tpl/_html-head.tpl" }}

<body>
<!--[if lt IE 7]>
    <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->
 
{{ include file="_tpl/header.tpl" }}
<div role="main" class="main site-register">
    <div class="main-alpha">
        <h1>{{ #register# }}</h1>
        <div class="form-register">
            {{ $form }}
        </div>
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
    </div> 
    <div class="main-beta clearfix">
        {{ include file="_tpl/user-sidebar.tpl" }}          
    </div>
</div>

{{ include file="_tpl/footer.tpl" }}

{{ include file="_tpl/_html-foot.tpl" }}

