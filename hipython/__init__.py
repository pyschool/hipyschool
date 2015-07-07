__version__ = '1.0.2'

from story.story import BaseStory
from . import print_method


class Story(BaseStory):

    name = 'hipython'
    title = 'Introuction to python'
    adventures = [
        print_method
    ]
