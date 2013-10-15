{{* assign counter and maximum count for collecting multimedia files *}}
{{assign var=multimediacounter value=0}}
{{assign var=multimediacountermax value=5}}
{{ list_articles length="100" ignore_issue="true" ignore_section="true" order="bypublishdate desc" }}
  {{* check if we have to do anything => not yet hit maximum *}}
  {{if $multimediacounter lt $multimediacountermax}}
      {{* assign variable for current article. 1 => has multimedia *}}
      {{assign var=multimediacurrent value=0}}
      {{ foreach $gimme->article->slideshows as $slideshow }}
        {{assign var=multimediacurrent value=1}}
        {{assign var=multimediatype value='slideshow'}}
      {{ /foreach }}
      {{ if $gimme->article->has_attachments }} 
          {{ list_article_attachments }}
              {{ if $gimme->attachment->extension == oga }}    
                {{assign var=multimediacurrent value=1}}              
                {{assign var=multimediatype value='audio'}}
              {{ elseif $gimme->attachment->extension == ogv || $gimme->attachment->extension == ogg || $gimme->attachment->extension == mp4 || $gimme->attachment->extension == webm }}             
                {{assign var=multimediacurrent value=1}}
                {{assign var=multimediatype value='video'}}
              {{ /if }}  
          {{ /list_article_attachments }}   
      {{ /if }}  
      {{* check now if multimedia found *}}
      {{if $multimediacurrent == 1}}
        {{* add to array with multimedia articles *}}
        {{append var=multimedia value="`$multimediatype`" index="`$gimme->article->number`"}}
        {{* increase counter to check for max number *}}
        {{ assign "multimediacounter" $multimediacounter+1 }}
      {{/if}}
  {{/if}}
{{ /list_articles }}  
<div class="news-sections news-sections-multimedia">
      <h2>Multimedia</h2>
      <div id="slider-multimedia" class="news-slider slider-multimedia">
      {{foreach from=$multimedia key=articleID item=multimediaType name=multimediaLoop}}

          {{ list_articles ignore_issue="true" ignore_section="true" length="1" constraints="number is `$articleID`"}}
          <div>
            {{ if $multimediaType=="video" || $multimediaType=='audio'}} 
                {{ list_article_attachments length="1" }}
                    {{ if $multimediaType == "audio" }}
                      <h3><span aria-hidden="true" class="icon-music"></span> Audio</h3>
                    {{ elseif $multimediaType == "video" }}
                      <h3><span aria-hidden="true" class="icon-play"></span> Video</h3>
                    {{ /if }}
                {{ /list_article_attachments }}
            {{ else }}
                      <h3><span aria-hidden="true" class="icon-camera"></span> Image</h3>
                    {{ /if }}
              {{ if $multimediaType=="video" || $multimediaType=='audio'}} 
                {{ list_article_attachments length="1" }}
                    {{ if $multimediaType == "audio" }}
                      <a href="{{ uri options="article" }}#audioattachment">
                    {{ elseif $multimediaType == "video" }}
                      <a href="{{ uri options="article" }}#videoattachment">
                    {{ /if }}
                {{ /list_article_attachments }}
            {{ else }}
                      <a href="{{ uri options="article" }}#imageattachment">
                    {{ /if }}
              
                {{ include file="_tpl/img/img_rectangle.tpl" where="no"}}
              </a>
            </div>
            {{ /list_articles }}
      {{/foreach}}
      </div>
  </div>