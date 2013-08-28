{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include file="_tpl/_html-head.tpl" }}

<body>
<!--[if lt IE 7]>
    <p class="chromeframe">{{ #outdatedBrowser# }}</p>
<![endif]-->
 
{{ include file="_tpl/header.tpl" }}
<main role="main" class="main site-pw">
    <section class="main-alpha">
        <h1>{{ #setNewPassword# }}</h1>
        {{ if $form->isErrors() }}
        <p class="info info-error"><span aria-hidden="true" class="icon-blocked"></span> {{ #yourPasswordCouldNotBeChanged# }}</p>
        {{ /if }}
        <form class="form" action="{{ $form->getAction() }}" class="zend_form" method="{{ $form->getMethod() }}">
            {{ $form->password->setLabel("Neues Passwort")->removeDecorator('Errors') }}
            {{ if $form->password->hasErrors() }}
                <p class="info info-error"><span aria-hidden="true" class="icon-blocked"></span> {{ #pleaseEnterYourNewPassword# }}</p>
            {{ /if }}
            {{ $form->password_confirm->setLabel("Retype your password")->removeDecorator('Errors') }}
            {{ if $form->password_confirm->hasErrors() && !$form->password->hasErrors() }}
                <p class="info info-error"><span aria-hidden="true" class="icon-blocked"></span> {{ #theConfirmationPasswordDoesNotMatch# }}</span>
            {{ /if }}
            <input type="submit" id="submit" class="button" value="{{ #savePassword# }}" />
        </form>
    </section>
    <aside class="main-beta clearfix">
        {{ include file="_tpl/user-sidebar.tpl" }}          
    </aside>
</main>


{{ include file="_tpl/footer.tpl" }}

{{ include file="_tpl/_html-foot.tpl" }}
