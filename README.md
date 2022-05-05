## Python wrappers for gslib

### Building the library

First we need to clone and build gslib:
```
git clone https://github.com/Nek5000/gslib.git
cd gslib
CFLAGS="-O2 -fPIC" make MPI=1
cd ..
```

```sh
git clone https://github.com/SealUofI/gslib.py
cd gslib.py
make
```
