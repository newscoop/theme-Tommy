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