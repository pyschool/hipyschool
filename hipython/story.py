from story.story import BaseStory

from . import print_method
from .data import _


class Story(BaseStory):

    name = 'hipython'
    title = _('Introuction to python')
    adventures = [
        print_method
    ]
