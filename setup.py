from distutils.core import setup

version = __import__('hellopython').__version__

setup(
    name='hellopython',
    version=version,
    packages=['hellopython'],
    license='MIT',
    author='PySchool',
    url='https://github.com/pyschool/hellopython/',
    description='The hellopython workshop.',
    include_package_data=True,
    scripts=['hellopython/bin/hellopython.py'],
    entry_points={
        'console_scripts': [
            'hellopython = hellopython.workshop:run_from_command_line',
        ]
    },
)
