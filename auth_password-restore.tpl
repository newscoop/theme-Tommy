{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include file="_tpl/_html-head.tpl" }}

<body>
<!--[if lt IE 7]>
    <p class="chromeframe">{{ #outdatedBrowser# }}</p>
<![endif]-->
 
{{ include file="_tpl/header.tpl" }}
<main role="main" class="main site-pw">
    <section class="main-alpha">
        <h1>{{ #resetPassword# }}</h1>
        {{ if $form->email->hasErrors() }}
         <div class="info info-error">
             <p><span aria-hidden="true" class="icon-blocked"></span> {{ #emailIsNotCorrect# }}</p>
         </div>
        {{ /if }}
        <form class="form" action="{{ $form->getAction() }}"  class="zend_form" method="{{ $form->getMethod() }}">
            {{ $form->email->setLabel("E-Mail")->removeDecorator('Errors') }}</dl>
            <input type="submit" id="submit" class="button" value="{{ #requestNewPassword# }}">
        </form>
    </section>
    <aside class="main-beta clearfix">
        {{ include file="_tpl/user-sidebar.tpl" }}          
    </aside>         

 </main>

{{ include file="_tpl/footer.tpl" }}

{{ include file="_tpl/_html-foot.tpl" }}
