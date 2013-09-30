<!-- _tpl/article-comments.tpl-->
{{ if $gimme->article->comment_count > 0 }}
<section id="comments" class="article-attachments article-comments">
    <a href="#comment-form" class="article-comments-write">{{ #writeComment# }}</a>
    <h3>{{ #comments# }} ( {{ $gimme->article->comment_count}} )</h3>
    <ul>
        {{list_article_comments order="bydate desc"}}
        <li id="comment-{{$gimme->current_list->index}}" class="article-comment">
                <time datetime="{{ $gimme->comment->submit_date }}">{{ $gimme->comment->submit_date }}</time>
                {{ if $gimme->comment->user->identifier }}
                <a href="http://{{ $gimme->publication->site }}/user/profile/{{ $gimme->comment->user->uname|urlencode }}">
                    <img src="{{ include file='_tpl/user-image.tpl' user=$user width=60 height=60 }}" class="avatar" alt="{{ $gimme->comment->user->uname }}">
                </a>
                {{ else }}
                    <img src="{{ include file='_tpl/user-image.tpl' user=$user width=60 height=60 }}" class="avatar" alt="{{ $gimme->comment->user->uname }}">
                {{ /if }}                                               
                <h4>
                {{ if $gimme->comment->user->identifier }}
                    <a href="http://{{ $gimme->publication->site }}/user/profile/{{ $gimme->comment->user->uname|urlencode }}">{{ $gimme->comment->user->uname }}</a>
                {{ else }}
                    {{ $gimme->comment->nickname }} ({{ #anonymous# }})
                {{ /if }}
                </h4>
                
                <p>{{ $gimme->comment->content}}</p>
        </li>
        {{/list_article_comments}}
    
    </ul>
</section>
{{ /if }}

<!-- COMMENT FORM -->
<section id="comment-form" class="article-attachments article-comments">
    <h3>{{ #yourOpinion# }}</h3>
     {{ if !$gimme->user->logged_in}}
        <a href="{{ $view->url(['controller' => 'auth', 'action' =>'index'], 'default') }}" >{{ #loginOrSignUp# }}</a>
    {{/if}}
        
    {{ if !$gimme->publication->public_comments }}
        <!-- public comments are not allowed-->
        {{ if $gimme->user->logged_in }}
            <!-- user is logged in -->
            {{ if $gimme->article->number && $gimme->article->comments_locked == 0 && $gimme->article->comments_enabled == 1}}
                {{ if $gimme->submit_comment_action->defined && $gimme->submit_comment_action->rejected }}
                <p>{{ #yourCommentHasNotBeenAccepted# }}</p>
                {{ /if }}

                {{ if $gimme->submit_comment_action->is_error }}
                    <p>{{ $gimme->submit_comment_action->error_message }}</p>
                {{ else }}
                    {{ if $gimme->submit_comment_action->defined }}
                        {{ if $gimme->publication->moderated_comments }}
                            <p>{{ #yourCommentHasBeenSentForApproval# }}</p>
                        {{ /if }}
                    {{ /if }}   
                {{ /if }}
                {{ comment_form html_code="id=\"commentform\" class=\"article-comment-form\"" _button="{{ #submitComment# }}" }}
                    {{ camp_edit object="comment" attribute="content" html_code="id=\"comment\"  placeholder=\"Write your message here\" " }}
                    {{* recaptcha *}}
                {{ /comment_form }}
            {{ else }}
                <p>{{ #commentsLocked# }}</p>
            {{ /if }}
        {{ else }}
            <p>{{ #registrationNeeded# }}</p>
        {{ /if }}
    {{ else }}
        <!-- public comments are allowed-->
        {{ if $gimme->user->logged_in }}
            {{ if $gimme->article->number && $gimme->article->comments_locked == 0 && $gimme->article->comments_enabled == 1}}
                {{ if $gimme->submit_comment_action->defined && $gimme->submit_comment_action->rejected }}
                    <p>{{ #yourCommentHasNotBeenAccepted# }}</p>
                {{ /if }}

                {{ if $gimme->submit_comment_action->is_error }}
                    <p>{{ $gimme->submit_comment_action->error_message }}</p>
                {{ else }}
                    {{ if $gimme->submit_comment_action->defined }}
                        {{ if $gimme->publication->moderated_comments }}
                            <p>{{ #yourCommentHasBeenSentForApproval# }}</p>
                        {{ /if }}
                    {{ /if }}   
                {{ /if }}

                {{ comment_form html_code="id=\"commentform\" class=\"article-comment-form\"" _button="{{ #submitComment# }}" }}
                    {{ camp_edit object="comment" attribute="content" html_code="id=\"comment\"  placeholder=\"Write your message here\" " }}
                    {{* recaptcha *}}
                {{ /comment_form }}
            {{ else }}
                <p>{{ #commentsLocked# }}</p>
            {{ /if }}
        {{ else }}
            <!-- user is not logged in -->
            {{ if $gimme->article->number && $gimme->article->comments_locked == 0 && $gimme->article->comments_enabled == 1}}
                {{ if $gimme->submit_comment_action->defined && $gimme->submit_comment_action->rejected }}
                    <p>{{ #yourCommentHasNotBeenAccepted# }}</p>
                {{ /if }}

                {{ if $gimme->submit_comment_action->is_error }}
                    <p>{{ $gimme->submit_comment_action->error_message }}</p>
                {{ else }}
                    {{ if $gimme->submit_comment_action->defined }}
                        {{ if $gimme->publication->moderated_comments }}
                            <p>{{ #yourCommentHasBeenSentForApproval# }}</p>
                        {{ /if }}
                    {{ /if }}   
                {{ /if }}


                {{ comment_form html_code="id=\"commentform\" class=\"article-comment-form\"" _button="{{ #submitComment# }}" }}
                    {{ camp_edit object="comment" attribute="nickname" html_code="id=\"author\"  placeholder=\"Your name\" " }}
                    {{ camp_edit object="comment" attribute="reader_email" html_code="id=\"email\"  placeholder=\"Your Email\"" }}
                    {{ camp_edit object="comment" attribute="content" html_code="id=\"comment\"  placeholder=\"Write your message here\" " }}
                    {{* recaptcha *}}

                {{ /comment_form }}
            {{ else }}
                <p>{{ #commentsLocked# }}</p>
            {{ /if }}
        {{ /if }}
    {{ /if }}

</section>
<!--  end _tpl/article-comments.tpl-->
