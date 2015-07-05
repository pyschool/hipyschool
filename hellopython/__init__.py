__version__ = '1.0.0'

from story.story import BaseStory
from . import print_method


class Story(BaseStory):

    name = 'hellopython'
    title = 'Introuction to python'
    adventures = [
        print_method
    ]
