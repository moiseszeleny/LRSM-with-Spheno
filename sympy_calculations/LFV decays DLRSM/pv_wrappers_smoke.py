import mpmath as mp
from LFVXD.numeric import qcdloop_pv_wrappers as w

mp.dps = 80
print('mp.dps=', mp.dps)

m1 = mp.mpf('1000')
m2 = mp.mpf('1000.000000000001')
ma = mp.mpf('0.105')
mX = mp.mpf('125')

r1 = w.B1_0(ma, m1, m2)
r2 = w.C0_(mX, ma, ma, m1, m2, mp.mpf('900'))
print('B1_0 ->', type(r1), r1)
print('C0_ ->', type(r2), r2)

with open('pv_wrappers_smoke.txt','w') as f:
    f.write(f'mp.dps={mp.dps}\n')
    f.write(f'B1_0: {type(r1)} {r1}\n')
    f.write(f'C0_: {type(r2)} {r2}\n')
