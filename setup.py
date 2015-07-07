from setuptools import setup, find_packages

version = __import__('hipython').__version__

setup(
    name='hipython',
    version=version,
    license='MIT',
    author='PySchool',
    url='https://github.com/pyschool/hipython/',
    description='The hipython workshop.',
    packages=find_packages(),
    install_requires=[
        'story',
    ],
    entry_points={
        'console_scripts': [
            'hipython = hipython.Story:begin',
        ]
    },
)
