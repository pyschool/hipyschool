from story.story import BaseStory
from story.translation import gettext as _

from . import print_method


__author__ = """PySchool"""
__email__ = 'pyschool@sophilabs.co'
__version__ = '1.0.7'


class Story(BaseStory):

    name = 'hipyschool'
    title = _('Sample pyschool story.')
    adventures = [
        print_method
    ]
