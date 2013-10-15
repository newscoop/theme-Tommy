{{ if $gimme->article->has_attachments }} 
  {{assign var=hasvideo value=0}}
  {{ list_article_attachments }}
    {{ if $gimme->attachment->extension == oga || $gimme->attachment->extension == mp3 || $gimme->attachment->extension == MP3  }}          
    <div class="article-attachments" id="audioattachment">
      <h3> {{ #listen# }}</h3>
        <audio src="{{ uri options="articleattachment" }}" controls></audio>
        <a href="{{ uri options="articleattachment" }}">{{ #downloadAudioFile# }} ( .{{ $gimme->attachment->extension }} )</a>
    </div><!-- /#audio-attachment -->
    {{ elseif $gimme->attachment->extension == ogv || $gimme->attachment->extension == ogg || $gimme->attachment->extension == flv || $gimme->attachment->extension == mp4 || $gimme->attachment->extension == webm }}             
        {{append var=videosources value="{{ uri options="articleattachment" }}" index="`$gimme->attachment->extension`"}}
        {{assign var = hasvideo value = true}}
    {{ else }}
    <div class="article-attachments">
        <h3> {{ #attachment# }}</h3>
        <a href="{{ uri options="articleattachment" }}">{{ #download# }} | {{ $gimme->attachment->file_name }} ({{ $gimme->attachment->size_kb }}kb)</a>
        <p>{{ $gimme->attachment->description }}</p>
    </div><!-- /.attachment -->
    {{ /if }}

  {{ /list_article_attachments }}      
  {{ /if }}  

  {{ if $hasvideo == true }}
  <div class="article-attachments" id="videoattachment">
    <h3> {{ #watch# }}</h3>
      <div class="flowplayer" data-engine="flash" data-swf="{{ url static_file='_js/vendor/flowplayer/flowplayer.swf' }}" data-ratio="0.417">
        <video >
          {{foreach from=$videosources key=extension item=videoSource name=videoLoop}}
          <source src="{{ $videoSource }}" type='video/{{if $extension == flv }}flash{{ elseif $extension == ogv}}ogg{{ else }}{{ $extension }}{{ /if }}'>
          {{/foreach}}
        </video>
      </div>
      {{foreach from=$videosources key=extension item=videoSource name=videoLoop}}
      <a href="{{ $videoSource }}" class="btn btn-mini btn-red">{{ #download# }} ( .{{ $extension }} )</a>
      {{/foreach}}
  </div><!-- /#video-attachment --> 
{{ /if }}
