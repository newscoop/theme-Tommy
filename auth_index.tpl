{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include file="_tpl/_html-head.tpl" }}

<body>
<!--[if lt IE 7]>
    <p class="chromeframe">{{ #outdatedBrowser# }}</p>
<![endif]-->
 
{{ include file="_tpl/header.tpl" }}
<main role="main" class="main site-login">
    <section class="main-alpha">
        <h1>{{ #login# }}</h1>
        <form class="form" action="{{ $form->getAction() }}" class="zend_form" method="{{ $form->getMethod() }}">
            {{ if $form->isErrors() }}
            <div class="info info-error">
                <h5><span aria-hidden="true" class="icon-blocked"></span> {{ #loginFailed# }}</h5>
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
    </section>
    <aside class="main-beta clearfix">
        {{ include file="_tpl/user-sidebar.tpl" }}          
    </aside>
</main>

{{ include file="_tpl/footer.tpl" }}

{{ include file="_tpl/_html-foot.tpl" }}
