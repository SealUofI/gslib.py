import os
from Cython.Build import cythonize
from setuptools import Extension, find_packages, setup

mpi_compile_info = os.popen("mpicc -compile_info").read().strip().split(" ")
mpi_link_info = os.popen("mpicc -link_info").read().strip().split(" ")

gslib = Extension(
    "gslib_wrapper",
    sources=["src/gslib_wrapper.pyx"],
    include_dirs=["../gslib/build/include"],
    libraries=["gs"],
    library_dirs=["../gslib/build/lib"],
    extra_compile_args=mpi_compile_info[1:],
    extra_link_args=mpi_link_info[1:],
)

setup(
    name="gslib.py",
    version="0.1",
    description="gslib.py - Python wrappers for gslib",
    long_description=open("README.md", "r").read(),
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "Intended Audience :: Other Audience",
        "Intended Audience :: Science/Research",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Topic :: Software Development :: Libraries",
    ],
    python_requires="~=3.8",
    install_requires=["Cython==0.29", "mpi4py==3.1.3"],
    extras_require={"dev": ["pytest", "black", "isort"]},
    url="https://github.com/SealUofI/gslib.py",
    license="MIT",
    packages=find_packages(),
    ext_modules=cythonize(gslib, language_level=3),
)
