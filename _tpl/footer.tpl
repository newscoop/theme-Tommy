<footer class="footer-alpha clearfix" role="contentinfo">
    <div class="footer-main">
        <div>
            <h4>{{ #sections# }}</h4>
            <ul>
            {{ local }}
            {{ set_current_issue }}
            {{ list_sections }}
                <li><a href="{{ url options='section' }}" title="{{ $gimme->section->name }}"> {{ $gimme->section->name }}</a></li>
            {{ /list_sections }}
            {{ /local }}
            </ul>
        </div>
        <div>
            <h4>{{ #moreLinks# }}</h4>
            <ul>
            {{ list_articles ignore_issue="true" ignore_section="true" constraints="type is page" }}
                <li><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></li>
            {{ /list_articles }}
                <li><a title="{{ #opensNewWindow# }}" target="_blank" href="http://twitter.com/sourcefabric "><span aria-hidden="true" class="icon-twitter"></span> Twitter</a></li>
                <li><a title="{{ #opensNewWindow# }}" target="_blank"  href="http://facebook.com/sourcefabric "><span aria-hidden="true" class="icon-facebook"></span> Facebook</a></li>
                <li><a title="{{ #opensNewWindow# }}" target="_blank" href="/en/static/rss"><span aria-hidden="true" class="icon-feed"></span> RSS</a></li> 
                <li><a href="/?tpl=6"><span aria-hidden="true" class="icon-list"></span> {{ #archive# }}</a></li>                           
            </ul>
        </div>
        <div>
            <h4>{{ #aboutUs# }}</h4>
            <p>{{ #newscoopPromo# }}</p>
        </div>
        <div class="copyright">
            <p>{{ #copyrightMessage# }} <a title="{{ #opensNewWindow# }}" target="_blank" href="http://www.sourcefabric.org/en/newscoop/">Powered by Newscoop.</a> <a target="_blank" href="http://www.sourcefabric.org/">Designed by Sourcefabric</a></p>
            <p>Newscoop Tommy Theme</p>
        </div>
        <a class="link-to-top" href="#top">{{ #backToTop# }}</a>
    </div>
</footer>
