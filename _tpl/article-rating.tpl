<div class="article-rating article-attachments">
    <h3>{{ #articleRating# }} : </h3>
    <div id="{{ $gimme->article->number }}" class="rate_widget">
        <ul class="stars">
            <li class="star_1 ratings_stars">1 {{ #outOf# }} 5</li>
            <li class="star_2 ratings_stars">2 {{ #outOf# }} 5</li>
            <li class="star_3 ratings_stars">3 {{ #outOf# }} 5</li>
            <li class="star_4 ratings_stars">4 {{ #outOf# }} 5</li>
            <li class="star_5 ratings_stars">5 {{ #outOf# }} 5</li>
        </ul>
        <p class="total_votes"></p>
        <p class="rating_error"></p>
    </div>
</div>