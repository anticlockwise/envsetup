from powerline.segments import Segment, with_docstring
from powerline.lib.shell import run_cmd

import re

VOLUME_PATTERN = re.compile(r'\[(\d+%)\]')


class VolumeSegment(Segment):
    """
    Powerline segment for displaying the current volume
    """
    def __call__(self, device='Master', **kwargs):
        amixer_stats = self.get_amixer_stats(device, **kwargs)
        if not amixer_stats:
            return None

        return [{
            'contents': '%s,%s' % amixer_stats,
            'highlight_group': ['cpu_load_percent']
        }]

    def get_amixer_stats(self, device, pl):
        amixer_output = run_cmd(pl, ['amixer', '-M', 'get', '-D', 'pulse', device])
        for line in amixer_output.split("\n"):
            cleaned_line = line.strip()
            if cleaned_line.startswith("Front Left"):
                match = VOLUME_PATTERN.search(cleaned_line)
                if match is not None:
                    left = match.group(1)
            elif cleaned_line.startswith("Front Right"):
                match = VOLUME_PATTERN.search(cleaned_line)
                if match is not None:
                    right = match.group(1)

        return (left, right)

    def argspecobjs(self):
        for ret in super(VolumeSegment, self).argspecobjs():
            yield ret
        yield 'get_amixer_stats', self.get_amixer_stats

    def omitted_args(self, name, method):
        return (0,)


volume = with_docstring(VolumeSegment(),
                        '''Volume segment using amixer''')
