<form class="users-search" action="{{ $view->url(['controller' => 'user', 'action' => 'search'], 'default', true) }}" method="GET">
    <label class="acc" for="q">{{ #search# }}</label>
    <input type="search" placeholder="{{ #searchUsers# }}" name="q">
    <input type="submit" value="{{ #search# }}">
</form>

<section class="user-list">
    {{ foreach $users as $user }}
        <article class="news-sections">
            <h2><a  href="{{ $view->url(['username' => $user->uname], 'user') }}">{{ $user->first_name }} {{ $user->last_name }}</a></h2>
            <a href="{{ $view->url(['username' => $user->uname], 'user') }}">
                <img width="60" src="{{ include file="_tpl/user-image.tpl" user=$user width=50 height=50 }}" alt="{{ $user->uname }}">
            </a>
            
            <p>{{ #memberSince# }} <time class="timeago" datetime="{{ $user->created|camp_date_format:'%M %e, %Y' }}">{{ $user->created|camp_date_format:"%M %e, %Y" }}</time></p>
            {{ if $user->posts_count > 0 }}
                <p>{{ $user->posts_count }}&nbsp;{{ #posts# }}</p>
            {{ else }}
                <p>{{ #noPosts# }}</p>
            {{ /if }}
        </article>
        {{ /foreach }}      
</section>