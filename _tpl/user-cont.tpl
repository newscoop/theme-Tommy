<form class="users-search" action="{{ $view->url(['controller' => 'user', 'action' => 'search'], 'default', true) }}" method="GET">
    <input type="search" placeholder="{{ #searchUsers# }}" name="q">
    <input type="submit" value="{{ #search# }}">
</form>

<section class="user-list">
    {{ foreach $users as $user }}
        <article class="news-sections">
            <h2><a  href="{{ $view->url(['username' => $user->uname], 'user') }}">{{ $user->first_name }} {{ $user->last_name }}</a></h2>
            <a href="{{ $view->url(['username' => $user->uname], 'user') }}">
                <img src="{{ include file="_tpl/user-image.tpl" user=$user width=50 height=50 }}" alt="{{ $user->uname }}">
            </a>
            
            <p>{{ #memberSince# }} <time class="timeago" datetime="{{ $user->created|date_format:'%Y-%m-%d' }} 06:00:00">{{ $user->created|date_format:"%Y-%m-%d" }} 06:00:00</time></p>
            {{ if $user->posts_count > 0 }}
                <p>{{ $user->posts_count }}&nbsp;{{ #posts# }}</p>
            {{ else }}
                <p>no&nbsp;{{ #posts# }} yet</p>
            {{ /if }}
        </article>
        {{ /foreach }}      
</section>