from setuptools import setup, find_packages

version = __import__('hipython').__version__

setup(
    name='hipython',
    version=version,
    packages=find_packages(),
    license='MIT',
    author='PySchool',
    url='https://github.com/pyschool/hipython/',
    description='The hipython workshop.',
    include_package_data=True,
    entry_points={
        'console_scripts': [
            'hipython = hipython.Story:begin',
        ]
    },
)
