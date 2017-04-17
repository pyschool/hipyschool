from hipyschool import Story


class TestStory(object):

    def test_name(self):
        assert Story().name == 'hipyschool'
