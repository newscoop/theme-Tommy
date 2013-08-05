<footer class="footer-alpha clearfix">
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
            <li><a target="_blank" href="http://twitter.com/sourcefabric ">{{ #followUs# }}</a></li>
            <li><a target="_blank"href="http://facebook.com/sourcefabric ">{{ #beOurFan# }}</a></li>
            <li><a href="/en/static/rss">{{ #subscribeToOurFeed# }}</a></li> 
            <li><a href="/?tpl=6">{{ #archive# }}</a></li>                           
        </ul>
    </div>
    <div>
        <h4>{{ #aboutUs# }}</h4>
        <p>Developed and used by news organisations like Switzerland’s TagesWoche, ElPeriódico de Guatemala and Yemen Times, Newscoop 4 aims to help independent news organisations manage online publications, enrich content and find new audiences.</p>
    </div>
    <div>
        <p>{{ #copyrightMessage# }}</p>
    </div>
    <a class="link-to-top" href="#top">{{ #backToTop# }}</a>
</footer>
