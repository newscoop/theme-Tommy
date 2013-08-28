{{ if !$user->is_active }}
{{ url static_file="_img/user_inactive_60x60.png" }}
{{ else if $user->image() }}
{{ $user->image($width, $height) }}
{{ else }}
{{ url static_file="_img/user_inactive_60x60.png" }}
{{ /if }}
