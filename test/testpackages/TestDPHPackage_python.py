import numpy as np
import numpy.matlib as ml
import matplotlib.pyplot as plt
import butools
from butools.utils import *
from butools.ph import *
from butools.dph import *
from butools.map import *
from butools.moments import *
from butools.reptrans import*
from butools.mc import *
from contextlib import redirect_stdout

def TestDPHPackage():
	print('---BuTools: DPH package test file---')
	print('Enable the verbose messages with the BuToolsVerbose flag')
	butools.verbose = True
	print('Enable input parameter checking with the BuToolsCheckInput flag')
	butools.checkInput = True
	np.set_printoptions(precision=5,linewidth=1024)
	print("========================================")
	print('Testing BuTools function MomentsFromMG')
	print('Input:')
	print('------')
	a = ml.matrix([[-0.6, 0.3, 1.3]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.25, 0.2, -0.15],[0.3, 0.1, 0.25],[0, 0.2, 0.47]])
	print('A = ')
	print(A)
	print('Test:')
	print('-----')
	print('moms = MomentsFromMG(a,A):')
	moms = MomentsFromMG(a,A)
	print('moms = ')
	print(moms)
	assert CheckMoments(moms)==True , 'The function returned invalid moments!'
	print('Test:')
	print('-----')
	print('moms = MomentsFromMG(a,A,3):')
	moms = MomentsFromMG(a,A,3)
	print('moms = ')
	print(moms)
	assert CheckMoments(moms)==True , 'The function returned invalid moments!'
	print("========================================")
	print('Testing BuTools function MomentsFromDPH')
	print('Input:')
	print('------')
	a = ml.matrix([[0.76, 0, 0.24]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.34, 0.66, 0],[0.79, 0.05, 0.07],[0.26, 0.73, 0.01]])
	print('A = ')
	print(A)
	print('Test:')
	print('-----')
	print('moms = MomentsFromDPH(a,A,5):')
	moms = MomentsFromDPH(a,A,5)
	print('moms = ')
	print(moms)
	assert CheckMoments(moms)==True , 'The function returned invalid moments!'
	print("========================================")
	print('Testing BuTools function PmfFromMG')
	print('Input:')
	print('------')
	a = ml.matrix([[-0.6, 0.3, 1.3]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.25, 0.2, -0.15],[0.3, 0.1, 0.25],[0, 0.2, 0.47]])
	print('A = ')
	print(A)
	x = np.arange(0,101.0,1)
	print('Test:')
	print('-----')
	print('pmf = PmfFromMG(a,A,x):')
	pmf = PmfFromMG(a,A,x)
	assert np.all(pmf>=0) , 'PmfFromMG returned negative pmf!'
	assert np.abs(np.dot(pmf,x) - MomentsFromMG(a,A,1)[0])<10**-10 , 'The mean computed from the pmf does not match the theoretical result!'
	print("========================================")
	print('Testing BuTools function PmfFromDPH')
	print('Input:')
	print('------')
	a = ml.matrix([[0.76, 0, 0.24]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.34, 0.66, 0],[0.79, 0.05, 0.07],[0.26, 0.73, 0.01]])
	print('A = ')
	print(A)
	x = np.arange(0,1001.0,1)
	print('Test:')
	print('-----')
	print('pmf = PmfFromDPH(a,A,x):')
	pmf = PmfFromDPH(a,A,x)
	assert np.all(pmf>=0) , 'PmfFromDPH returned negative pmf!'
	assert np.abs(np.dot(pmf,x) - MomentsFromDPH(a,A,1)[0])<10**-10 , 'The mean computed from the pmf does not match the theoretical result!'
	print("========================================")
	print('Testing BuTools function CdfFromMG')
	print('Input:')
	print('------')
	a = ml.matrix([[-0.6, 0.3, 1.3]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.25, 0.2, -0.15],[0.3, 0.1, 0.25],[0, 0.2, 0.47]])
	print('A = ')
	print(A)
	x = np.arange(0,101.0,1)
	print('Test:')
	print('-----')
	print('cdf = CdfFromMG(a,A,x):')
	cdf = CdfFromMG(a,A,x)
	assert np.all(np.diff(cdf)>-1e-15) , 'The cdf is not increasing monotonously!'
	assert np.abs(np.sum(1-cdf) - MomentsFromMG(a,A,1)[0])<10**-10 , 'The mean computed from the cdf does not match the theoretical result!'
	print("========================================")
	print('Testing BuTools function CdfFromDPH')
	print('Input:')
	print('------')
	a = ml.matrix([[0.76, 0, 0.24]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.34, 0.66, 0],[0.79, 0.05, 0.07],[0.26, 0.73, 0.01]])
	print('A = ')
	print(A)
	x = np.arange(0,1001.0,1)
	print('Test:')
	print('-----')
	print('cdf = CdfFromDPH(a,A,x):')
	cdf = CdfFromDPH(a,A,x)
	assert np.all(np.diff(cdf)>-1e-15) , 'The cdf is not increasing monotonously!'
	assert np.abs(np.sum(1-cdf) - MomentsFromDPH(a,A,1)[0])<10**-10 , 'The mean computed from the cdf does not match the theoretical result!'
	print("========================================")
	print('Testing BuTools function RandomDPH')
	print('Test:')
	print('-----')
	print('a,A = RandomDPH(3,10,5):')
	a,A = RandomDPH(3,10,5)
	print('a = ')
	print(a)
	print('A = ')
	print(A)
	assert CheckDPHRepresentation(a,A) , 'RandomDPH failed to return a valid DPH representation!'
	assert np.max(np.abs(MomentsFromDPH(a,A,1)[0]-10))<10**-14 , 'RandomDPH failed to match the given mean value!'
	print("========================================")
	print('Testing BuTools function CheckMGRepresentation')
	print('Input:')
	print('------')
	a = ml.matrix([[-0.6, 0.3, 1.3]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.25, 0.2, -0.15],[0.3, 0.1, 0.25],[0, 0.2, 0.47]])
	print('A = ')
	print(A)
	print('Test:')
	print('-----')
	print('flag = CheckMGRepresentation(a,A):')
	flag = CheckMGRepresentation(a,A)
	print('flag = ')
	print(flag)
	assert flag==True , 'CheckMGRepresentation failed to recognize a valid MG distribution!'
	print('Input:')
	print('------')
	a = ml.matrix([[-0.6, 0.3, 1.3]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.35, 0.2, -0.25],[0.3, 0.1, 0.25],[0, 0.2, 0.47]])
	print('A = ')
	print(A)
	print('Test:')
	print('-----')
	print('flag = CheckMGRepresentation(a,A):')
	flag = CheckMGRepresentation(a,A)
	print('flag = ')
	print(flag)
	assert flag==False , 'CheckMGRepresentation failed to recognize wrong eigenvalues!'
	print("========================================")
	print('Testing BuTools function CheckDPHRepresentation')
	print('Input:')
	print('------')
	a = ml.matrix([[0.48, 0.08, 0.26, 0.18]])
	print('a = ')
	print(a)
	A = ml.matrix([[0, 0.08, 0.08, 0.8],[0.55, 0, 0.24, 0.19],[0.06, 0.03, 0, 0.001],[0.23, 0.005, 0.2, 0.53]])
	print('A = ')
	print(A)
	print('Test:')
	print('-----')
	print('flag = CheckDPHRepresentation(a,A):')
	flag = CheckDPHRepresentation(a,A)
	print('flag = ')
	print(flag)
	assert flag==True , 'CheckDPHRepresentation failed to recognize a valid DPH distribution!'
	print('Input:')
	print('------')
	a = ml.matrix([[0.48, 0.08]])
	print('a = ')
	print(a)
	A = ml.matrix([[0, 0.08],[0.55, 0.5]])
	print('A = ')
	print(A)
	print('Test:')
	print('-----')
	print('flag = CheckDPHRepresentation(a,A):')
	flag = CheckDPHRepresentation(a,A)
	print('flag = ')
	print(flag)
	assert flag==False , 'CheckDPHRepresentation failed to recognize wrong row sums!'
	print("========================================")
	print('Testing BuTools function MGFromMoments')
	print('Input:')
	print('------')
	moms = [4.08, 20.41, 130.45, 1054.41, 10463.73]
	print('moms = ')
	print(moms)
	print('Test:')
	print('-----')
	print('a,A = MGFromMoments(moms):')
	a,A = MGFromMoments(moms)
	print('a = ')
	print(a)
	print('A = ')
	print(A)
	print('memoms = MomentsFromMG(a,A,5):')
	memoms = MomentsFromMG(a,A,5)
	print('memoms = ')
	print(memoms)
	assert la.norm(np.array(moms)-np.array(memoms))<10**-9 , 'The moments of the result of MGFromMoments do not match the input!'
	print("========================================")
	print('Testing BuTools function DPHFromMG')
	print('Input:')
	print('------')
	a = ml.matrix([[-0.6, 0.3, 1.3]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.1, 0.2, 0],[0.3, 0.1, 0.25],[-0.3, 0.2, 0.77]])
	print('A = ')
	print(A)
	print('Test:')
	print('-----')
	print('flag = CheckMGRepresentation(a,A):')
	flag = CheckMGRepresentation(a,A)
	print('flag = ')
	print(flag)
	print('flag = CheckDPHRepresentation(a,A):')
	flag = CheckDPHRepresentation(a,A)
	print('flag = ')
	print(flag)
	print('b,B = DPHFromMG(a,A):')
	b,B = DPHFromMG(a,A)
	print('b = ')
	print(b)
	print('B = ')
	print(B)
	print('flag = CheckDPHRepresentation(b,B):')
	flag = CheckDPHRepresentation(b,B)
	print('flag = ')
	print(flag)
	Cm = SimilarityMatrix(A,B)
	err1 = la.norm(A*Cm-Cm*B)
	err2 = la.norm(a*Cm-b)
	print('Transformation errors:')
	print(np.max(err1,err2))
	assert flag  and  err1<10**-12  and  err2<10**-12 , 'Transformation to DPH failed!'
	print("========================================")
	print('Testing BuTools function CanonicalFromDPH2')
	print('Input:')
	print('------')
	a = ml.matrix([[0, 1.0]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.23, 0.22],[0.41, 0.48]])
	print('A = ')
	print(A)
	print('Test:')
	print('-----')
	print('b,B = CanonicalFromDPH2(a,A):')
	b,B = CanonicalFromDPH2(a,A)
	print('b = ')
	print(b)
	print('B = ')
	print(B)
	print('ev = la.eigvals(A):')
	ev = la.eigvals(A)
	print('ev = ')
	print(ev)
	print('flag = CheckDPHRepresentation(b,B):')
	flag = CheckDPHRepresentation(b,B)
	print('flag = ')
	print(flag)
	Cm = SimilarityMatrix(A,B)
	err1 = la.norm(A*Cm-Cm*B)
	err2 = la.norm(a*Cm-b)
	assert err1<10**-12  and  err2<10**-12 , 'Transformation to canonical DPH(2) failed!'
	print('Input:')
	print('------')
	a = ml.matrix([[1.0, 0]])
	print('a = ')
	print(a)
	A = ml.matrix([[0, 0.61],[0.56, 0.44]])
	print('A = ')
	print(A)
	print('Test:')
	print('-----')
	print('b,B = CanonicalFromDPH2(a,A):')
	b,B = CanonicalFromDPH2(a,A)
	print('b = ')
	print(b)
	print('B = ')
	print(B)
	print('ev = la.eigvals(A):')
	ev = la.eigvals(A)
	print('ev = ')
	print(ev)
	print('flag = CheckDPHRepresentation(b,B):')
	flag = CheckDPHRepresentation(b,B)
	print('flag = ')
	print(flag)
	Cm = SimilarityMatrix(A,B)
	err1 = la.norm(A*Cm-Cm*B)
	err2 = la.norm(a*Cm-b)
	print('Transformation errors:')
	print(np.max(err1,err2))
	assert err1<10**-12  and  err2<10**-12 , 'Transformation to canonical DPH(2) failed!'
	print("========================================")
	print('Testing BuTools function CanonicalFromDPH3')
	print('Input:')
	print('------')
	a = ml.matrix([[0.46, 0.22, 0.32]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.67, 0.01, 0.12],[0.06, 0.45, 0.15],[0.18, 0.43, 0.32]])
	print('A = ')
	print(A)
	print('Test:')
	print('-----')
	print('b,B = CanonicalFromDPH3(a,A):')
	b,B = CanonicalFromDPH3(a,A)
	print('b = ')
	print(b)
	print('B = ')
	print(B)
	print('ev = la.eigvals(A):')
	ev = la.eigvals(A)
	print('ev = ')
	print(ev)
	print('flag = CheckDPHRepresentation(b,B):')
	flag = CheckDPHRepresentation(b,B)
	print('flag = ')
	print(flag)
	Cm = SimilarityMatrix(A,B)
	err1 = la.norm(A*Cm-Cm*B)
	err2 = la.norm(a*Cm-b)
	print('Transformation errors:')
	print(np.max(err1,err2))
	assert flag  and  err1<10**-12  and  err2<10**-12 , 'Transformation to canonical DPH(3) failed!'
	print('Input:')
	print('------')
	a = ml.matrix([[0.76, 0.12, 0.12]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.31, 0., 0.],[0.98, 0., 0.02],[0.88, 0.04, 0.08]])
	print('A = ')
	print(A)
	print('Test:')
	print('-----')
	print('b,B = CanonicalFromDPH3(a,A):')
	b,B = CanonicalFromDPH3(a,A)
	print('b = ')
	print(b)
	print('B = ')
	print(B)
	print('ev = la.eigvals(A):')
	ev = la.eigvals(A)
	print('ev = ')
	print(ev)
	print('flag = CheckDPHRepresentation(b,B):')
	flag = CheckDPHRepresentation(b,B)
	print('flag = ')
	print(flag)
	Cm = SimilarityMatrix(A,B)
	err1 = la.norm(A*Cm-Cm*B)
	err2 = la.norm(a*Cm-b)
	print('Transformation errors:')
	print(np.max(err1,err2))
	assert flag  and  err1<10**-12  and  err2<10**-12 , 'Transformation to canonical DPH(3) failed!'
	print('Input:')
	print('------')
	a = ml.matrix([[0.67, 0.07, 0.26]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.31, 0., 0.],[0.98, 0., 0.02],[0.88, 0.04, 0.08]])
	print('A = ')
	print(A)
	print('Test:')
	print('-----')
	print('b,B = CanonicalFromDPH3(a,A):')
	b,B = CanonicalFromDPH3(a,A)
	print('b = ')
	print(b)
	print('B = ')
	print(B)
	print('ev = la.eigvals(A):')
	ev = la.eigvals(A)
	print('ev = ')
	print(ev)
	print('flag = CheckDPHRepresentation(b,B):')
	flag = CheckDPHRepresentation(b,B)
	print('flag = ')
	print(flag)
	Cm = SimilarityMatrix(A,B)
	err1 = la.norm(A*Cm-Cm*B)
	err2 = la.norm(a*Cm-b)
	print('Transformation errors:')
	print(np.max(err1,err2))
	assert flag  and  err1<10**-12  and  err2<10**-12 , 'Transformation to canonical DPH(3) failed!'
	print('Input:')
	print('------')
	a = ml.matrix([[0.78, 0.04, 0.18]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.06, 0.25, 0.31],[0.45, 0.18, 0.33],[0.98, 0, 0.01]])
	print('A = ')
	print(A)
	print('Test:')
	print('-----')
	print('b,B = CanonicalFromDPH3(a,A):')
	b,B = CanonicalFromDPH3(a,A)
	print('b = ')
	print(b)
	print('B = ')
	print(B)
	print('ev = la.eigvals(A):')
	ev = la.eigvals(A)
	print('ev = ')
	print(ev)
	print('flag = CheckDPHRepresentation(b,B):')
	flag = CheckDPHRepresentation(b,B)
	print('flag = ')
	print(flag)
	Cm = SimilarityMatrix(A,B)
	err1 = la.norm(A*Cm-Cm*B)
	err2 = la.norm(a*Cm-b)
	print('Transformation errors:')
	print(np.max(err1,err2))
	assert flag  and  err1<10**-12  and  err2<10**-12 , 'Transformation to canonical DPH(3) failed!'
	print("========================================")
	print('Testing BuTools function AcyclicDPHFromMG')
	print('Input:')
	print('------')
	a = ml.matrix([[0, 0, 1.0]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.22, 0, 0],[0.3, 0.1, 0.55],[0.26, 0, 0.73]])
	print('A = ')
	print(A)
	print('Test:')
	print('-----')
	print('b,B = AcyclicDPHFromMG(a,A):')
	b,B = AcyclicDPHFromMG(a,A)
	print('b = ')
	print(b)
	print('B = ')
	print(B)
	print('ma = MomentsFromMG(a,A,5):')
	ma = MomentsFromMG(a,A,5)
	print('ma = ')
	print(ma)
	print('mb = MomentsFromMG(b,B,5):')
	mb = MomentsFromMG(b,B,5)
	print('mb = ')
	print(mb)
	print('flag = CheckDPHRepresentation(b,B):')
	flag = CheckDPHRepresentation(b,B)
	print('flag = ')
	print(flag)
	Cm = SimilarityMatrix(A,B)
	err1 = la.norm(A*Cm-Cm*B)
	err2 = la.norm(a*Cm-b)
	print('Transformation errors:')
	print(np.max(err1,err2))
	assert err1<10**-12  and  err2<10**-12 , 'Transformation to canonical PH(3) failed!'
	print("========================================")
	print('Testing BuTools function DPH2From3Moments')
	print('Input:')
	print('------')
	a = ml.matrix([[0.9, 0.1]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.2, 0.61],[0.58, 0.41]])
	print('A = ')
	print(A)
	print('Test:')
	print('-----')
	print('moms = MomentsFromDPH(a,A):')
	moms = MomentsFromDPH(a,A)
	print('moms = ')
	print(moms)
	print('b,B = DPH2From3Moments(moms):')
	b,B = DPH2From3Moments(moms)
	print('b = ')
	print(b)
	print('B = ')
	print(B)
	print('phmoms = MomentsFromDPH(b,B,3):')
	phmoms = MomentsFromDPH(b,B,3)
	print('phmoms = ')
	print(phmoms)
	assert la.norm((np.array(phmoms)-np.array(moms))/np.array(moms))<10**-12 , 'The moments of the result of DPH2From3Moments do not match the input!'
	print("========================================")
	print('Testing BuTools function DPH3From5Moments')
	print('Input:')
	print('------')
	a = ml.matrix([[0.7, 0.1, 0.2]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.2, 0.51, 0.1],[0.58, 0.41, 0],[0.1, 0.4, 0.3]])
	print('A = ')
	print(A)
	print('Test:')
	print('-----')
	print('moms = MomentsFromDPH(a,A):')
	moms = MomentsFromDPH(a,A)
	print('moms = ')
	print(moms)
	print('b,B = DPH3From5Moments(moms):')
	b,B = DPH3From5Moments(moms)
	print('b = ')
	print(b)
	print('B = ')
	print(B)
	print('phmoms = MomentsFromMG(b,B,5):')
	phmoms = MomentsFromMG(b,B,5)
	print('phmoms = ')
	print(phmoms)
	assert la.norm((np.array(phmoms)-np.array(moms))/np.array(moms))<10**-12 , 'The moments of the result of DPH3From5Moments do not match the input!'
	print("========================================")
	print('Testing BuTools function SamplesFromDPH')
	print('Input:')
	print('------')
	a = ml.matrix([[0.76, 0, 0.24]])
	print('a = ')
	print(a)
	A = ml.matrix([[0.34, 0.66, 0],[0.79, 0.05, 0.07],[0.26, 0.73, 0.01]])
	print('A = ')
	print(A)
	print('x = SamplesFromDPH(a,A,1000):')
	x = SamplesFromDPH(a,A,1000)
	print('mp = MomentsFromDPH(a,A,3):')
	mp = MomentsFromDPH(a,A,3)
	print('mp = ')
	print(mp)

if __name__ == "__main__":
	TestDPHPackage()
