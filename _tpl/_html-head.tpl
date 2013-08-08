<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
  <head>
    <meta charset="utf-8">
    <title>{{ if $gimme->article->defined }}{{ $gimme->article->name }} | {{ elseif $gimme->section->defined }}{{ $gimme->section->name }} | {{ /if }}{{ $gimme->publication->name }}</title>
    <meta name="viewport" content="width=device-width>
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

    <link rel="shortcut icon" href="{{ url static_file='_img/favicon.ico' }}">
    <link rel="apple-touch-icon" href="{{ url static_file='_img/apple-touch-icon.png' }}">

   <!--[if lt IE 9]>
       <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
       <script>window.html5 || document.write('<script src="{{ url static_file='_js/vendor/html5shiv.js'}}"><\/script>')</script>
   <![endif]-->

   <!-- jQuery Library -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="{{ url static_file='_js/vendor/jquery-1.9.1.min.js'}}"><\/script>')</script>
    <!-- picturefill -->
    <script src="{{ url static_file="_js/matchmedia.js" }}"></script>
    <script src="{{ url static_file="_js/picturefill.js" }}"></script>

    <script src="{{ url static_file="_js/slider.js" }}"></script>

    <script>
    if (window.innerWidth > 500) {
      $(function() {
        $('#slider-front').addClass('news-slider');
        $("#slider-front").responsiveSlides({
          maxwidth: 960,
          auto: false,
          speed: 800,
          nav: true,
          random: true,
          pause: true
        });
      });
    }
    $(function() {
      $("#slider-multimedia").responsiveSlides({
        maxwidth: 330,
        auto: false,
        speed: 1200,
        pager: false,
        random: true,
        pause: true
      });
    });
    </script>
    {{ if $gimme->template->name == 'article.tpl'}}
      <script src="{{ url static_file='_js/vendor/galleria/galleria-1.2.9.min.js'}}"></script>
      <link href="{{ url static_file='_css/flowplayer_skin/minimalist.css' }}" rel="stylesheet">
      <script src="{{ url static_file='_js/vendor/flowplayer/flowplayer.min.js' }}"></script>
      <script>
      $(document).ready(function() {
          
          $('.rate_widget').each(function(i) {
              var widget = this;
              var out_data = {
                  f_article_number : $(widget).attr('id')
              };
              $.post(
                  '/rating/show',
                  out_data,
                  function(INFO) {
                      $(widget).data( 'fsr', INFO );
                      set_votes(widget);
                  },
                  'json'
              );
          });


          $('.ratings_stars').hover(
              // Handles the mouseover
              function() {
                  $(this).prevAll().andSelf().addClass('ratings_over');
                  $(this).nextAll().removeClass('ratings_vote'); 
              },
              // Handles the mouseout
              function() {
                  $(this).prevAll().andSelf().removeClass('ratings_over');
                  // can't use 'this' because it wont contain the updated data
                  set_votes($(this).closest('.rate_widget'));
              }
          );
          
          
          // This actually records the vote
          $('.ratings_stars').bind('click', function() {
              var star = this;
              var widget = $(this).closest('.rate_widget');
              var score = $(star).attr('class').match(/star_(\d+)/)[1];
       
              var clicked_data = {
                  f_rating_score : score,
                  f_article_number : widget.attr('id')
              };
              $.post(
                  '/rating/save',
                  clicked_data,
                  function(INFO) {
                      widget.data( 'fsr', INFO );
                      set_votes(widget);
                  },
                  'json'
              ); 
          });

          var isSlideshow = $('#gallery').is(':visible');

          if (isSlideshow) {
            Galleria.loadTheme('{{ url static_file='_js/vendor/galleria/themes/classic/galleria.classic.min.js'}}');
            Galleria.run('#gallery');
          }
      });

      function set_votes(widget) {
          if ($(widget).data('fsr')) {
              var avg = $(widget).data('fsr').whole_avg;
              var votes = $(widget).data('fsr').number_votes;
              var exact = $(widget).data('fsr').dec_avg;
              var error = $(widget).data('fsr').error;

              $(widget).find('.star_' + avg).prevAll().andSelf().addClass('ratings_vote');
              $(widget).find('.star_' + avg).nextAll().removeClass('ratings_vote'); 
              $(widget).find('.total_votes').text(votes + ' {{ #voteS# }}, {{ #averageRating# }} ' + exact);
              $(widget).find('.rating_error').text(error);
          }
      }
      </script>
      <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
      </script>
      <script src="http://connect.facebook.net/en_US/all.js#appId=100924830001723&amp;xfbml=1"></script>
      <script>
        (function(d) {
          var po = d.createElement('script'); po.type = 'text/javascript'; po.async = true;
          po.src = 'https://apis.google.com/js/plusone.js';
          var s = d.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
        })(document);
      </script>
    {{/if}}
    <script>
    $(document).ready(function () {

      $('.poll-button').click(function(){
        $.post($('form[name=debate]').attr("action"),$('form[name=debate]').serialize(),function(data){$('.box-poll').html(data);});
        return false;
      });

    });
    </script>
</head>
