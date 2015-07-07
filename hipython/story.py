from story.story import BaseStory

from . import print_method


class Story(BaseStory):

    name = 'hipython'
    title = 'Introuction to python'
    adventures = [
        print_method
    ]
