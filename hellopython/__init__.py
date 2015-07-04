__version__ = '1.0.0'

from workshopper.workshop import BaseWorkshop
from . import print_method


class Workshop(BaseWorkshop):

    name = 'hellopython'
    problems = [
        print_method
    ]
