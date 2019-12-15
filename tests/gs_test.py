import pytest

import numpy as np

from gslib_wrapper import GS

from gslib_wrapper import gs_double,gs_float,gs_int,gs_long
from gslib_wrapper import gs_add,gs_mul,gs_min,gs_max,gs_bpr

def test_gs_init():
    world=0
    gs=GS(world)
    assert gs.get_id()==0
    assert gs.get_np()==1

def test_gs_setup():
    world=0
    gs=GS(world)

    ids=np.array([1,2,1,5])
    gs.setup(ids)

    assert gs.is_setup_valid()==True

def test_gs_01():
    world=0
    gs=GS(world)

    ids=np.array([1,2,1,5])
    gs.setup(ids)

    values=np.array([1.0,2.0,3.0,4.0])
    gs.gs(values,gs_double,gs_add)

    assert np.allclose(values,np.array([4.0,2.0,4.0,4.0]))

def test_gs_02():
    world=0
    gs=GS(world)

    ids=np.array([1,2,3,4,5,2,3,6])
    gs.setup(ids)

    values=np.array([1.0,1.0,1.0,1.0,1.0,-1.0,-1.0,1.0])
    gs.gs(values,gs_double,gs_add)

    assert np.allclose(values,np.array([1.,0.,0.,1.,1.,0.,0.,1.]))


if __name__ == "__main__":
    print('test_gs_init-------------------')
    test_gs_init()
    print('test_gs_setup------------------')
    test_gs_setup()
    print('test_gs_01---------------------')
    test_gs_01()
    print('test_gs_02---------------------')
    test_gs_02()
