{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include file="_tpl/_html-head.tpl" }}

<body>
<!--[if lt IE 7]>
    <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->
 
{{ include file="_tpl/header.tpl" }}
<div role="main" class="main site-pw">
    <div class="main-alpha">
        <h1>{{ #setNewPassword# }}</h1>
        {{ if $form->isErrors() }}
        <p class="info info-error">{{ #yourPasswordCouldNotBeChanged# }}</p>
        {{ /if }}
        <form class="form" action="{{ $form->getAction() }}" class="zend_form" method="{{ $form->getMethod() }}">
            {{ $form->password->setLabel("Neues Passwort")->removeDecorator('Errors') }}
            {{ if $form->password->hasErrors() }}
                <p class="info info-error">{{ #pleaseEnterYourNewPassword# }}</p>
            {{ /if }}
            {{ $form->password_confirm->setLabel("Retype your password")->removeDecorator('Errors') }}
            {{ if $form->password_confirm->hasErrors() && !$form->password->hasErrors() }}
                <p class="info info-error">{{ #theConfirmationPasswordDoesNotMatch# }}</span>
            {{ /if }}
            <input type="submit" id="submit" class="button" value="{{ #savePassword# }}" />
        </form>
    </div>
    <div class="main-beta clearfix">
        {{ include file="_tpl/user-sidebar.tpl" }}          
    </div>
</div>


{{ include file="_tpl/footer.tpl" }}

{{ include file="_tpl/_html-foot.tpl" }}
