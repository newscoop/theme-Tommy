{{ list_issues order="bynumber desc" constraints="number greater 1" }} 

    <article class="news-sections clearfix">
        <header>
            <h2><a href="{{ uri options="template issue.tpl" }}">{{ $gimme->issue->name}}</a></h2>
            <p>{{ #publishedOn# }} <time datetime="{{ $gimme->issue->publish_date|date_format:"%Y-%m-%dT%H:%MZ" }}">{{ $gimme->issue->publish_date|camp_date_format:"%d %M %Y" }}</time></p>
        </header>
    </article>

{{ /list_issues }}    