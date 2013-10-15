{{ assign var="counter1" value=0 }}
{{ foreach $gimme->article->slideshows as $slideshow }}            
{{ foreach $slideshow->items as $item }}      
	{{ assign var="counter1" value=2 }}             
{{ /foreach }}
{{ /foreach }}
<div class="news-sections box-ad" id="imageattachment">
    {{ if $counter1 == "2" }}
	<h2>Slideshow</h2>
    {{ /if }}
{{ foreach $gimme->article->slideshows as $slideshow }}

	<div id="gallery" class="galleria-wrapper">
	{{ assign var="style" value='true' }}
	{{ assign var="counter" value=0 }}              
	{{ foreach $slideshow->items as $item }}      
		{{ assign var="counter" value=$counter+1 }}
		<img src="{{ $item->image->src }}" data-title="{{ $item->caption }}" />                
	{{ /foreach }}
	</div>
{{ /foreach }}
</div>