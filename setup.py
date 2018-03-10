from distutils.core import setup, Extension
from Cython.Build import cythonize

gslib = Extension('gslib_wrapper', ['src/gslib_wrapper.pyx'], include_dirs=[],
                  libraries=['gs'], library_dirs=[])

setup(
    name='gslib - Python wrappers',
    ext_modules=cythonize(gslib)
)
