{{ list_debates length="1" item="article" }}
<div class="news-sections box-poll widget-debate" id="debate">
    <h2>{{ #debateVoting# }}</h2>
    <div class="widget-wrap">
        <div class="widget-content">
            {{ include file="_tpl/debate_votes_total.tpl" scope="parent" }}

            {{ if $gimme->debate->is_votable }}
                {{ $smarty.capture.votes }}
                {{ include file="_tpl/debate-deadline.tpl" }}
            {{ /if }}


        {{ if $gimme->default_article->defined }}
        	<div class="vote-box-poll">
                {{ if $gimme->debate->is_votable }}
                {{ debate_form template="article.tpl" submit_button=false }}
                    {{ list_debate_answers order="bynumber asc" }}
                        
                 <a class="poll-button poll-button-debate" onclick="$('#answer-{{ $gimme->debateanswer->number }}').attr('checked','checked');$(this).parents('form:eq(0)').submit(); return false;" href="javascript:void(0)">{{ $gimme->debateanswer->answer }}</a>
                        <!-- f_debateanswer_nr name mandatory -->
                        <label for="f_debateanswer_nr">{{ $gimme->debateanswer->answer }}</label>
                        <input type="radio" name="f_debateanswer_nr"
                            value="{{ $gimme->debateanswer->number }}" id="answer-{{ $gimme->debateanswer->number }}"
                            onclick="$(this).parents('form:eq(0)').submit();" />
                    {{ /list_debate_answers }}
                <input type="submit" id="submit-debate" class="button" value="Vote" />
                {{ /debate_form }}
                {{ /if }}      
            </div>
            {{ if $gimme->debate->is_votable }}<p><small>{{ #changeYourMind# }}</small></p>
            {{ elseif $gimme->user->logged_in or !$gimme->debate->is_current }}<p><small>{{ #debateClosed# }}</small></p>
            {{ elseif $gimme->debate->is_current && !$gimme->user->logged_in }}<p><small><a href="/auth">{{ #pleaseLoginVote# }}</a></small></p>{{ /if }}
        {{ /if }}
        </div>
    </div>
{{ /list_debates }} 
