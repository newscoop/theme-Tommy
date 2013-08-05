<div data-picture data-alt="{{ image rendition="sectiontop" }}{{ $image->caption }} (photo: {{ $image->photographer }}){{ /image }}">
		{{ image rendition="sectiontop" }}
			<div data-src="{{ $image->src }}"></div>
		{{ /image }}
		{{ image rendition="slider" }}
			<div data-src="{{ $image->src }}" data-media="(min-width: 350px)"></div>
		{{ /image }}

		<noscript>
		{{ image rendition="sectiontop" }}
			<img src="{{ $image->src }}" alt="{{ $image->caption }} (photo: {{ $image->photographer }})">
		{{ /image }}
		</noscript>
  </div>
