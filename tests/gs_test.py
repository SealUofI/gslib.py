import pytest

import numpy as np

from gslib_wrapper import GS

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
"""
np = 1
idd = np.zeros((np+4,), dtype=int);
T = np.zeros((np+4,), dtype=int);

idd[0] = np+10+3*0
for i in range(1,np+1):
    idd[i+1] = -1*(i+1);
idd[np+1] = comm->id+1;
idd[np+2] = comm->id+1;
idd[np+3] = np-comm->id;

gsh = gs_setup(idd,np+4,comm,0,method,1);
"""
