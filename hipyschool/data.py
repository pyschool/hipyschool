import os
import gettext

domain = 'hipyschool'
localedir = os.path.join(os.path.dirname(__file__), 'locale/')
gettext.bindtextdomain(domain, localedir)
translation = gettext.translation(domain, localedir, fallback=True)
_ = lambda msg: gettext.dgettext(domain, msg)
