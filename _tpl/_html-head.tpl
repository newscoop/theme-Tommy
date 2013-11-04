<!DOCTYPE html>
<!--[if gte IEMobile 7]> <html class="no-js iemobile"> <![endif]-->
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js top" lang="en-en" dir="ltr"> <!--<![endif]-->
  <head>
    <meta charset="utf-8">
    <title>{{ if $gimme->article->defined }}{{ $gimme->article->name }} | {{ elseif $gimme->section->defined }}{{ $gimme->section->name }} | {{ /if }}{{ $gimme->publication->name }}</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    {{ if empty($siteinfo) }}{{ $siteinfo=['description' => '', 'keywords' => ''] }}{{ /if }}
    {{* if an article is active, meta-description of web page will be article's intro, otherwise it will pull site's description from System Preferences (/Configure/System Preferences) *}}
    <meta name="description" content="{{ if $gimme->article->defined }}{{ $gimme->article->deck|strip_tags:false|strip|escape:'html':'utf-8' }}{{ else }}{{ $siteinfo.description }}{{ /if }}">

    {{* if an article is active, meta-keywords will be generated of article keywords (defined on article edit screen), otherwise it will use site-wide keywords from System Preferences (/Configure/System Preferences) *}}
    <meta name="keywords" content="{{ if $gimme->article->defined }}{{ $gimme->article->keywords }}{{ else }}{{$siteinfo.keywords}}{{ /if }}" />
    
    <link href='http://fonts.googleapis.com/css?family=Merriweather+Sans' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="{{ url static_file='_css/css/styles.css' }}">
    <!--[if lte IE 9]>
       <link rel="stylesheet" href="{{ url static_file="_css/css/tommy.ie.css"}}">
    <![endif]-->

    <!-- RSS & Pingback -->
    <link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="http://{{ $gimme->publication->site }}/en/static/rss/">

    {{ if $gimme->article->defined }}{{* Open Graph protocol metatags for Facebook sharing *}}
    <meta property="og:title" content="{{$gimme->article->name|html_entity_decode|regex_replace:'/&(.*?)quo;/':'&quot;'}}" />
    <meta property="og:type" content="article" />
    <meta property="og:url" content="http://{{ $gimme->publication->site }}{{ uri }}" />
    <meta property="og:site_name" content="{{ $gimme->publication->name }}" />
    <meta property="og:description" content="{{$gimme->article->deck|strip_tags:false|strip|escape:'html':'utf-8' }}" />
    {{ list_article_images }}
    <meta property="og:image" content="{{ $gimme->article->image->imageurl }}" />
    {{ /list_article_images }}
    {{ /if }}

    <link rel="shortcut icon" href="{{ url static_file='favicon.ico' }}">
    <link rel="apple-touch-icon" href="{{ url static_file='apple-touch-icon.png' }}">

   <!--[if lt IE 9]>
       <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
       <script>window.html5 || document.write('<script src="{{ url static_file='_js/vendor/html5shiv.js'}}"><\/script>')</script>
       <script src="{{ url static_file="_js/respond.js" }}"></script>
   <![endif]-->

   <!-- Check for svg support -->
   <script>
    var issvg=function(){var div=document.createElement("div");div.innerHTML="<svg/>";return(div.firstChild&&div.firstChild.namespaceURI)==="http://www.w3.org/2000/svg"};if(issvg())document.documentElement.className="svg js";else document.documentElement.className=" js";
    </script>

</head>
