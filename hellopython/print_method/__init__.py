import codecs
import io
import sys

from workshopper.problems import BaseProblem


class Problem(BaseProblem):

    def test(self, file):
        old_stdout = sys.stdout
        sys.stdout = io.StringIO()
        eval(codecs.open(file).read())
        message = sys.stdout.getvalue()
        sys.stdout = old_stdout
        assert message == 'Hello World\n'
