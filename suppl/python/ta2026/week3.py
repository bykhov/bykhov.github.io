# -*- coding: utf-8 -*-
"""
Created on Thu Mar 26 10:46:35 2026

@author: Administrator
"""

x = [1,2,4,5]

for k in x[1:]:
    print(k)
    
#%%
y = range(1,5)

for k in y:
    print(k)
    
#%% mutable
x.append(7)

#%%
x1 = [1,2,4,5]
x2 = [5,6,7,8]
x1.insert(2,'a')
x1.remove(1)
print(x1)
a = x1.pop(1)
print(a)
print(x1)

#%%
x4 = ['a','c','b']
#x4.sort()
x5 = sorted(x4)
#%%
x6 = x4 * 2