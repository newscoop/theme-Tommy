{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
<div class="news-sections box-poll">
{{ list_articles length="1" ignore_issue="true" ignore_section="true" constraints="type is poll" }}
{{ list_debates length="1" item="article" }}
    {{ if $gimme->debate_action->defined }}
        <h2><span aria-hidden="true" class="icon-bullhorn"></span> {{ $gimme->debate->question }}</h2>
        {{ if $gimme->debate->user_vote_count >= $gimme->debate->votes_per_user || $gimme->debate_action->ok }}
            <p class="info info-success"><span aria-hidden="true" class="icon-checkmark-circle"></span> {{ #thankYouPoll# }}</p>
        {{ elseif $gimme->debate_action->is_error }}
            <p class="info info-error"><span aria-hidden="true" class="icon-blocked"></span> {{ #alreadyVoted# }}</p>
        {{ /if }}                        
        {{ assign var="votes" value=0 }}
        <fieldset id="debate_1_1_form">
          <legend class="acc">{{ $gimme->debate->question }}</legend>
        {{ list_debate_answers }}
          <div class="poll-option">
              <label for="radio{{ $gimme->current_list->index }}">{{ $gimme->debateanswer->answer }}</label>
              <div class="poll-progress">
                        <div class="bar" style="width:{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%;"></div>
                  </div>
              <span class="poll-score">{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%</span>
          </div>
            {{ assign var="votes" value=$votes+$gimme->debateanswer->votes }}
            {{ if $gimme->current_list->at_end }}
            <p>Number of votes: {{ $votes }}</p>
            {{ /if }}
        {{ /list_debate_answers }}
        </fieldset>
    {{ else }}
       {{ if $gimme->debate->is_votable }}

            <h2><span aria-hidden="true" class="icon-bullhorn"></span> {{ $gimme->debate->question }}</h2> 
            <p class="info-hidden info-no-answer info info-error"><span aria-hidden="true" class="icon-blocked"></span> {{ #pleaseSelectOneAnswer# }}</p>
            {{ debate_form template="_tpl/sidebar_poll.tpl" submit_button="{{ #pollButton# }}" html_code="class=\"poll-button\"" }}  
            
            {{* this is to find out template id for this template, will have to be assigned as hidden form field *}}     
            {{ $uriAry=explode("tpl=", {{ uri options="template _tpl/sidebar_poll.tpl" }}, 2) }}                        

            <input name="tpl" value="{{ $uriAry[1] }}" type="hidden">
            <fieldset id="debate_1_1_form">
              <legend class="acc">{{ $gimme->debate->question }}</legend>
            {{ list_debate_answers }}
              <div class="poll-option">
                  <!--input type="radio" id="radio{{ $gimme->current_list->index }}" name="radios1" /-->
                  <label for="radio{{ $gimme->current_list->index }}">{{ $gimme->debateanswer->answer }}
                  {{ debateanswer_edit html_code="id=\"radio{{ $gimme->current_list->index }}\"" }}
                  <span class="poll-score">{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%</span>
                  </label>
                  <div class="poll-progress">
                        <div class="bar" style="width:{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%;"></div>
                  </div>
              </div>
            {{ /list_debate_answers }}
            {{ /debate_form }}                        
            </fieldset>
       {{ else }}                       
            <h2><span aria-hidden="true" class="icon-bullhorn"></span> {{ $gimme->debate->question }}</h2> 
            {{ if $gimme->debate->user_vote_count >= $gimme->debate->votes_per_user }}
            <p class="info info-success"><span aria-hidden="true" class="icon-checkmark-circle"></span> {{ #thankYouPoll# }}</p>
            {{ /if }}
            <fieldset id="debate_1_1_form">
              <legend class="acc">{{ $gimme->debate->question }}</legend>
            {{ list_debate_answers }}
              <div class="poll-option">
                  <label for="radio{{ $gimme->current_list->index }}">{{ $gimme->debateanswer->answer }}
                        <span class="poll-score">{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%</span> 
                  </label>
                  <div class="poll-progress">
                        <div class="bar" style="width:{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%;"></div>
                  </div>
              </div>
            {{ /list_debate_answers }}
             </fieldset>
       {{ /if }}
    {{ /if }}
    {{ /list_debates }}
    {{ /list_articles }}
</div>