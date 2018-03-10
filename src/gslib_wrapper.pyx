from gslib cimport comm, comm_init, comm_free
import logging

logger = logging.getLogger('gslib_wrapper')
logger.setLevel(logging.DEBUG)

fh = logging.FileHandler('gslib_wrapper.log')
fh.setLevel(logging.DEBUG)

logger.addHandler(fh)

cdef class PyBase(object):
    cdef void_ptr ptr

cdef class PyComm(object):
    cdef comm c

    def __cinit__(self, int ec):
        comm_init(&self.c, ec)
        logger.debug('Created comm object.')

    def __dealloc__(self):
        comm_free(&self.c)
        logger.debug('Deleted comm object.')
