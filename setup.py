from setuptools import setup, find_packages

hipython = __import__('hipython')

setup(
    name='hipython',
    version=hipython.__version__,
    description=hipython.__doc__.strip(),
    author=hipython.__author__,
    license=hipython.__licence__,
    url='https://github.com/pyschool/hipython/',
    packages=find_packages(),
    install_requires=[
        'story',
    ],
    entry_points={
        'console_scripts': [
            'hipython = hipython.story:Story.begin',
        ]
    },
)
