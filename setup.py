from setuptools import setup, find_packages

hipyschool = __import__('hipyschool')

setup(
    name='hipyschool',
    version=hipyschool.__version__,
    description=hipyschool.__doc__.strip(),
    author=hipyschool.__author__,
    license=hipyschool.__licence__,
    url='https://github.com/pyschool/hipyschool/',
    packages=find_packages(),
    install_requires=[
        'story',
    ],
    entry_points={
        'console_scripts': [
            'hipyschool = hipyschool.story:Story.begin',
        ]
    },
    classifiers=[
        'Development Status :: 5 - Production/Stable',
        'Intended Audience :: Developers',
        'Natural Language :: English',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.3',
        'Programming Language :: Python :: 3.4',
        'Environment :: Console'
    ]
)
