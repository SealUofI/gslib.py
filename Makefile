all:
	python setup.py build_ext --inplace -L../gslib/lib -I../gslib/src

clean:
	rm -rf build/
	rm -rf *.so
	rm src/*.c
