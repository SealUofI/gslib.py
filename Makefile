all:
	python3 setup.py build_ext --inplace -L../gslib/build/lib -I../gslib/src

clean:
	$(RM) -rf build/
	$(RM) -rf *.so
	$(RM) src/*.c
	$(RM) src/*.swp

test:
	flake8
	flake8 --config .flake8.cython
