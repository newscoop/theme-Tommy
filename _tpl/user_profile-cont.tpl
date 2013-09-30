<h1>{{ if $profile['first_name_public'] }}{{ $user->first_name }}{{ /if }} {{ if $profile['last_name_public'] }} {{ $user->last_name }}{{ /if }} {{ if !$profile['first_name_public'] && !$profile['last_name_public'] }}{{$user->uname}}{{ /if }}

{{ if $gimme->user->uname == $user->uname }}
            <a class="user-edit-link" href='/dashboard'>Edit Profile </a>
        {{ /if }}
</h1>
    <div class="user-contact">
        <img class="user-image" src="{{ include file='_tpl/user-image.tpl' user=$user width=140 height=210 }}" alt="{{ #profilePicture# }} {{ #from# }} {{$user->uname}}"> 
        
        <p><b>{{ #gender# }}</b> {{ $profile['gender'] }}</p>
        <p><b>{{ #organisation# }}</b> {{ $profile['organisation']}}</p>
        <p><b>{{ #website# }}</b> <a class="link-color" href="{{ $profile['website']}}" rel="external">{{ $profile['website']|escape}}</a></p>
        <p><b>{{ #birthday# }}</b> {{ $profile['birth_date'] }}</p>
        {{ if $profile['twitter'] }}
        <p><b>Twitter</b> <a href="http://twitter.com/{{ $profile['twitter'] }}" rel="external" >{{ $profile['twitter'] }}</a></p>
        {{ /if }}
        {{ if $profile['facebook'] }}
        <p><b>Facebook</b> <a href="http://facebook.com/{{ $profile['facebook'] }}" rel="external" >{{ $profile['facebook'] }}</a></p>
        {{ /if }}
        {{ if $profile['google'] }}
        <p><b>Google+</b> <a href="http://plus.google.com/{{ $profile['google'] }}" rel="external" >+{{ $profile['google'] }}</a></p>
        {{ /if }}

        <p class="member-since">{{ #memberSince# }} <time class="timeago" datetime="{{ $user->created|date_format:'%Y-%m-%d' }} 06:00:00">{{ $user->created|camp_date_format:"%M %e, %Y" }}</time></p>
        {{ if $user->posts_count > 0 }}
        <p class="member-post">{{ $user->posts_count }} {{ #posts# }}</p>
        {{ /if }}
    </div>
{{ if $profile['bio'] }} 
<div class="user-about news-sections">                                                                
    <h2>{{ #about# }}</h2>
    <p>{{ $profile['bio']}}</p>
</div>
{{ /if }}