all: gslib
	python3 setup.py build_ext --inplace # -L../gslib/build/lib -I../gslib/src

gslib:
	$(MAKE) -C ../gslib

clean:
	$(RM) -rf build/ *.so src/*.c src/*.swp

test:
	flake8 --config .flake8.cython
