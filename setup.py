from distutils.core import setup, Extension
from Cython.Build import cythonize

gslib = Extension('gslib_wrapper',
                  sources=['src/gslib_wrapper.pyx'],
                  include_dirs=['../gslib/src'],
                  libraries=['gs'],
                  library_dirs=['../gslib/build/lib'],
                  extra_link_args=[]
                  )


setup(
    name='gslib - Python wrappers',
    ext_modules=cythonize(gslib, language_level=3)
)
