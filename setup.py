from setuptools import setup,Extension,find_packages
from Cython.Build import cythonize

gslib = Extension('gslib_wrapper',
    sources=['src/gslib_wrapper.pyx'],
    include_dirs=['../gslib/build/include'],
    libraries=['gs'],
    library_dirs=['../gslib/build/lib'],
    extra_link_args=[]
)

setup(name='gslib.py',
    version='0.1',
    description='gslib.py - Python wrappers for gather scatter library',
    license='MIT',
    packages=find_packages(),
    ext_modules=cythonize(gslib,language_level=3)
)
