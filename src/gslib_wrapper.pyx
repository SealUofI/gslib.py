from gslib cimport comm, comm_init, comm_free
from gslib cimport gs_data, gslib_gs_setup
from gslib cimport gs_auto, gs_pairwise, gs_crystal_router, gs_all_reduce
from gslib cimport gs_add, gs_mul, gs_min, gs_max, gs_bpr

import logging

logger = logging.getLogger('gslib_wrapper')
logger.setLevel(logging.DEBUG)

fh = logging.FileHandler('gslib_wrapper.log')
fh.setLevel(logging.DEBUG)

logger.addHandler(fh)

cdef class PyComm(object):
    cdef comm c
    cdef gs_data *g

    def __cinit__(self, int ec):
        comm_init(&self.c, ec)
        logger.debug('Created comm object.')
        cdef int idd = self.c.id
        g = gslib_gs_setup(&idd, 1, &self.c, 0, gs_auto, 1)
        logger.debug('Setup gs library.')

    def __dealloc__(self):
        comm_free(&self.c)
        logger.debug('Deleted comm object.')
