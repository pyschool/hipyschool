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
