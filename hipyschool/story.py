from story.story import BaseStory

from . import print_method
from .data import _


class Story(BaseStory):

    name = 'hipyschool'
    title = _('Sample pyschool story.')
    adventures = [
        print_method
    ]
