import codecs
import io
import sys

from story.adventures import BaseAdventure
from story.translation import gettext as _


class Adventure(BaseAdventure):

    title = _('Print method')

    def test(self, file):
        old_stdout = sys.stdout
        sys.stdout = io.StringIO()
        eval(codecs.open(file).read())
        message = sys.stdout.getvalue()
        sys.stdout = old_stdout
        assert message == _('Hi Python\n')
