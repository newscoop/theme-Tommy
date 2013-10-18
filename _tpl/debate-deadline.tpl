{{ $timestamp = sprintf('@%d', $gimme->debate->date_end) }}
{{ $closingdate=date_create($timestamp) }}
{{ $deadline=$closingdate->setTime(12, 0) }}
{{ $diff=date_diff($deadline, date_create('now')) }}
{{ if $deadline->getTimestamp() > time() }}
    <p>{{ #remaining# }} <small>{{ $diff->days }} {{ #days# }}, {{ $diff->h }} {{ #hours# }}, {{ $diff->i }} {{ #minutes# }} {{ #more# }}</small></p>
{{ else }}
    <p>{{ #discussionClosedOn# }} {{ $deadline->format('j.n.Y') }} {{ #atNoon# }} </p>	      
{{ /if }}