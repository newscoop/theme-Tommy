{{ if $gimme->user->is_admin }}
<a href="http://{{ $gimme->publication->site }}/admin/articles/edit.php?f_publication_id={{ $gimme->publication->identifier }}&f_issue_number={{ $gimme->issue->number }}&f_section_number={{ $gimme->section->number }}&f_article_number={{ $gimme->article->number }}&f_language_id={{ $gimme->language->number }}&f_language_selected={{ $gimme->language->number }}" target="_blank" 
style="" title="Edit article">
<span aria-hidden="true" class="icon-cog"></span> {{ #editArticle# }}
</a>
{{ /if }}