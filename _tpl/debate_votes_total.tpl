{{ include file="_tpl/debate-answers.tpl" scope="parent" }}
{{ capture name="votes" }}
    <div class="debate-score">
        {{ strip }}
        {{ foreach $answers as $answer }}
        <div class="debate-value">
	    	<div class="poll-progress">
				<div class="bar" style="width: {{ $answer.percent }}%"></div>
			</div>
	        <p><strong>{{ $answer.answer|escape }}</strong> {{ $answer.percent }}%</p>
    	</div>
        {{ /foreach }}
        {{ /strip }}
    </div>
{{ /capture }}
{{ if !$gimme->debate->is_votable }}
    {{ $smarty.capture.votes }}
    <p><small>{{ if $gimme->debate->is_current && !$gimme->user->logged_in }}{{ #currentResult# }}{{ else }}{{ #finalResult# }}{{ /if }}</small></p>
{{ /if }}