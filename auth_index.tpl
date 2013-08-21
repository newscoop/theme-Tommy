{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include file="_tpl/_html-head.tpl" }}

<body>
<!--[if lt IE 7]>
    <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->
 
{{ include file="_tpl/header.tpl" }}
<div role="main" class="main site-login">
    <div class="main-alpha">
        <h1>{{ #login# }}</h1>
        <form class="form" action="{{ $form->getAction() }}" class="zend_form" method="{{ $form->getMethod() }}">
            {{ if $form->isErrors() }}
            <div class="info info-error">
                <h5>{{ #loginFailed# }}</h5>
                <p>{{ #loginFailedMessage# }}</p>
                <p>{{ #tryAgainPlease# }}</p>
                <p><a href="{{ $view->url(['controller' => 'auth', 'action' => 'password-restore']) }}">{{ #forgotYourPassword# }}</a></p>
            </div>
            {{ /if }}
                {{ $form->email->setLabel("E-mail")->removeDecorator('Errors') }}
                {{ $form->password->setLabel("Password")->removeDecorator('Errors') }}
                <input type="submit" id="submit" class="button big" value="{{ #login# }}" />
        </form>
        <p>
            <a class="register-link link-color" href="{{ $view->url(['controller' => 'register', 'action' => 'index']) }}">Register | </a>
            <a class="register-link link-color" href="{{ $view->url(['controller' => 'auth', 'action' => 'password-restore']) }}">{{ #forgotYourPassword# }}</a>
        </p>
    </div>
    <div class="main-beta clearfix">
        {{ include file="_tpl/user-sidebar.tpl" }}          
    </div>
</div>

{{ include file="_tpl/footer.tpl" }}

{{ include file="_tpl/_html-foot.tpl" }}
