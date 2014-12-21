from powerline.lib.shell import run_cmd
from powerline.segments import with_docstring
from powerline.segments.common.players import PlayerSegment, _convert_state,\
    _convert_seconds


class MocPlayerSegment(PlayerSegment):
    """
    Powerline segment for MOC music player
    """
    def get_player_status(self, pl):
        """
        Returns MOC player information.

        mocp -i returns data with multi level information i.e.
            State: PAUSE
            File: <file_name>
            Title: <full_title>
            Artist: <artist_name>
            SongTitle: <track_title>
            ...
        """
        now_playing_str = run_cmd(pl, ['mocp', '-i'])
        if not now_playing_str:
            return

        now_playing = dict((parts[0], parts[1]) for parts in
                           [line.split(": ") for line in now_playing_str.split("\n")])
        state = _convert_state(now_playing.get("State"))
        return {
            'state': state,
            'album': now_playing.get('Album', ''),
            'artist': now_playing.get('Artist', ''),
            'title': now_playing.get('SongTitle', ''),
            'elapsed': _convert_seconds(int(now_playing.get('CurrentSec', 0))),
            'total': _convert_seconds(int(now_playing.get('TotalSec', 0)))
        }

moc = with_docstring(MocPlayerSegment(),
                     '''Return Music On Console information''')
