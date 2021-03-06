clear all
run('/home/gabor/github/butools/Matlab/BuToolsInit.m')

disp('---BuTools: PH package test file---');
disp('Enable the verbose messages with the BuToolsVerbose flag');
global BuToolsVerbose;
BuToolsVerbose = true;
disp('Enable input parameter checking with the BuToolsCheckInput flag');
global BuToolsCheckInput;
BuToolsCheckInput = true;
global BuToolsCheckPrecision;
format short g;
format compact
delete('/home/gabor/github/butools/test/docex/PH_matlab.docex');
diary('/home/gabor/github/butools/test/docex/PH_matlab.docex');
disp('=== MomentsFromME ===')
disp('>>> a = [0.2,0.3,0.5];');
a = [0.2,0.3,0.5];
disp('>>> A = [-1, 0, 0; 0, -3, 2; 0, -2, -3];');
A = [-1, 0, 0; 0, -3, 2; 0, -2, -3];
disp('>>> moms = MomentsFromME(a, A);');
moms = MomentsFromME(a, A);
disp('>>> disp(moms);');
disp(moms);
disp('>>> moms = MomentsFromME(a, A, 9);');
moms = MomentsFromME(a, A, 9);
disp('>>> disp(moms);');
disp(moms);
disp('=== MomentsFromPH ===')
disp('>>> a = [0.1,0.9,0];');
a = [0.1,0.9,0];
disp('>>> A = [-6.2, 2, 0; 2, -9, 1; 1, 0, -3];');
A = [-6.2, 2, 0; 2, -9, 1; 1, 0, -3];
disp('>>> moms = MomentsFromPH(a, A, 5);');
moms = MomentsFromPH(a, A, 5);
disp('>>> disp(moms);');
disp(moms);
disp('=== CdfFromME ===')
disp('>>> a = [0.2,0.3,0.5];');
a = [0.2,0.3,0.5];
disp('>>> A = [-1, 0, 0; 0, -3, 2; 0, -2, -3];');
A = [-1, 0, 0; 0, -3, 2; 0, -2, -3];
disp('>>> x = (0.0:0.01:5.0);');
x = (0.0:0.01:5.0);
disp('>>> cdf = CdfFromME(a, A, x);');
cdf = CdfFromME(a, A, x);
disp('>>> plot(x, cdf)');
disp('=== CdfFromPH ===')
disp('>>> a = [0.1,0.9,0];');
a = [0.1,0.9,0];
disp('>>> A = [-6.2, 2, 0; 2, -9, 1; 1, 0, -3];');
A = [-6.2, 2, 0; 2, -9, 1; 1, 0, -3];
disp('>>> x = (0.0:0.002:3.0);');
x = (0.0:0.002:3.0);
disp('>>> cdf = CdfFromPH(a, A, x);');
cdf = CdfFromPH(a, A, x);
disp('>>> plot(x, cdf)');
disp('=== PdfFromME ===')
disp('>>> a = [0.2,0.3,0.5];');
a = [0.2,0.3,0.5];
disp('>>> A = [-1, 0, 0; 0, -3, 2; 0, -2, -3];');
A = [-1, 0, 0; 0, -3, 2; 0, -2, -3];
disp('>>> x = (0.0:0.01:5.0);');
x = (0.0:0.01:5.0);
disp('>>> pdf = PdfFromME(a, A, x);');
pdf = PdfFromME(a, A, x);
disp('>>> plot(x, pdf)');
disp('=== PdfFromPH ===')
disp('>>> a = [0.1,0.9,0];');
a = [0.1,0.9,0];
disp('>>> A = [-6.2, 2, 0; 2, -9, 1; 1, 0, -3];');
A = [-6.2, 2, 0; 2, -9, 1; 1, 0, -3];
disp('>>> x = (0.0:0.002:3.0);');
x = (0.0:0.002:3.0);
disp('>>> pdf = PdfFromPH(a, A, x);');
pdf = PdfFromPH(a, A, x);
disp('>>> plot(x, pdf)');
disp('=== IntervalPdfFromPH ===')
disp('>>> a = [0.1,0.9,0];');
a = [0.1,0.9,0];
disp('>>> A = [-6.2, 2, 0; 2, -9, 1; 1, 0, -3];');
A = [-6.2, 2, 0; 2, -9, 1; 1, 0, -3];
disp('>>> x = (0.0:0.002:3.0);');
x = (0.0:0.002:3.0);
disp('>>> [x, y] = IntervalPdfFromPH(a, A, x);');
[x, y] = IntervalPdfFromPH(a, A, x);
disp('>>> plot(x, y)');
disp('=== RandomPH ===')
disp('>>> [a, A] = RandomPH(3, 8, 4);');
[a, A] = RandomPH(3, 8, 4);
disp('>>> disp(a);');
disp(a);
disp('>>> disp(A);');
disp(A);
disp('=== CheckMERepresentation ===')
disp('>>> a = [-0.2,0.2];');
a = [-0.2,0.2];
disp('>>> A = [1, -1; 1, -2];');
A = [1, -1; 1, -2];
disp('>>> flag = CheckMERepresentation(a, A);');
flag = CheckMERepresentation(a, A);
disp('>>> disp(flag);');
disp(flag);
disp('>>> a = [-0.2,0.4,0.8];');
a = [-0.2,0.4,0.8];
disp('>>> A = [-2, 0, 3; 0, -1, 1; 0, -1, -1];');
A = [-2, 0, 3; 0, -1, 1; 0, -1, -1];
disp('>>> flag = CheckMERepresentation(a, A);');
flag = CheckMERepresentation(a, A);
disp('>>> disp(flag);');
disp(flag);
disp('>>> a = [0.2,0.3,0.5];');
a = [0.2,0.3,0.5];
disp('>>> A = [-1, 0, 0; 0, -3, 2; 0, -2, -3];');
A = [-1, 0, 0; 0, -3, 2; 0, -2, -3];
disp('>>> flag = CheckMERepresentation(a, A);');
flag = CheckMERepresentation(a, A);
disp('>>> disp(flag);');
disp(flag);
disp('=== CheckPHRepresentation ===')
disp('>>> a = [0.2];');
a = [0.2];
disp('>>> A = [-1, 1; 1, -2];');
A = [-1, 1; 1, -2];
disp('>>> flag = CheckPHRepresentation(a, A);');
flag = CheckPHRepresentation(a, A);
disp('>>> disp(flag);');
disp(flag);
disp('>>> a = [0.2,0.7];');
a = [0.2,0.7];
disp('>>> A = [-1, 1; 1, -2];');
A = [-1, 1; 1, -2];
disp('>>> flag = CheckPHRepresentation(a, A);');
flag = CheckPHRepresentation(a, A);
disp('>>> disp(flag);');
disp(flag);
disp('=== CheckMEPositiveDensity ===')
disp('>>> a = [0.2,0.3,0.5];');
a = [0.2,0.3,0.5];
disp('>>> A = [-1, 0, 0; 0, -3, 2; 0, -2, -3];');
A = [-1, 0, 0; 0, -3, 2; 0, -2, -3];
disp('>>> flag = CheckMEPositiveDensity(a, A);');
flag = CheckMEPositiveDensity(a, A);
disp('>>> disp(flag);');
disp(flag);
disp('>>> a = [0.2,0.3,0.5];');
a = [0.2,0.3,0.5];
disp('>>> A = [-1, 0, 0; 0, -3, 2.9; 0, -2.9, -3];');
A = [-1, 0, 0; 0, -3, 2.9; 0, -2.9, -3];
disp('>>> flag = CheckMEPositiveDensity(a, A);');
flag = CheckMEPositiveDensity(a, A);
disp('>>> disp(flag);');
disp(flag);
disp('=== APHFrom3Moments ===')
disp('>>> moms = [10.0, 125.0, 8400.0];');
moms = [10.0, 125.0, 8400.0];
disp('>>> [a, A] = APHFrom3Moments(moms);');
[a, A] = APHFrom3Moments(moms);
disp('>>> disp(a);');
disp(a);
disp('>>> disp(A);');
disp(A);
disp('>>> phmoms = MomentsFromPH(a, A, 3);');
phmoms = MomentsFromPH(a, A, 3);
disp('>>> disp(phmoms);');
disp(phmoms);
disp('>>> moms = [10.0, 525.0, 31400.0];');
moms = [10.0, 525.0, 31400.0];
disp('>>> [a, A] = APHFrom3Moments(moms);');
[a, A] = APHFrom3Moments(moms);
disp('>>> disp(a);');
disp(a);
disp('>>> disp(A);');
disp(A);
disp('>>> phmoms = MomentsFromPH(a, A, 3);');
phmoms = MomentsFromPH(a, A, 3);
disp('>>> disp(phmoms);');
disp(phmoms);
disp('=== PH2From3Moments ===')
disp('>>> moms = [10.0, 160.0, 3500.0];');
moms = [10.0, 160.0, 3500.0];
disp('>>> [a, A] = PH2From3Moments(moms);');
[a, A] = PH2From3Moments(moms);
disp('>>> disp(a);');
disp(a);
disp('>>> disp(A);');
disp(A);
disp('>>> phmoms = MomentsFromPH(a, A, 3);');
phmoms = MomentsFromPH(a, A, 3);
disp('>>> disp(phmoms);');
disp(phmoms);
disp('>>> moms = [10.0, 260.0, 13500.0];');
moms = [10.0, 260.0, 13500.0];
disp('>>> [a, A] = PH2From3Moments(moms);');
[a, A] = PH2From3Moments(moms);
disp('>>> disp(a);');
disp(a);
disp('>>> disp(A);');
disp(A);
disp('>>> phmoms = MomentsFromPH(a, A, 3);');
phmoms = MomentsFromPH(a, A, 3);
disp('>>> disp(phmoms);');
disp(phmoms);
disp('=== PH3From5Moments ===')
disp('>>> a = [0.1,0.9,0];');
a = [0.1,0.9,0];
disp('>>> A = [-6.2, 2, 0; 2, -9, 1; 1, 0, -3];');
A = [-6.2, 2, 0; 2, -9, 1; 1, 0, -3];
disp('>>> moms = MomentsFromPH(a, A);');
moms = MomentsFromPH(a, A);
disp('>>> disp(moms);');
disp(moms);
disp('>>> [a, A] = PH3From5Moments(moms);');
[a, A] = PH3From5Moments(moms);
disp('>>> disp(a);');
disp(a);
disp('>>> disp(A);');
disp(A);
disp('>>> phmoms = MomentsFromME(a, A, 5);');
phmoms = MomentsFromME(a, A, 5);
disp('>>> disp(phmoms);');
disp(phmoms);
disp('>>> a = [0.2,0.3,0.5];');
a = [0.2,0.3,0.5];
disp('>>> A = [-1, 0, 0; 0, -3, 0.5; 0, -0.5, -3];');
A = [-1, 0, 0; 0, -3, 0.5; 0, -0.5, -3];
disp('>>> moms = MomentsFromME(a, A);');
moms = MomentsFromME(a, A);
disp('>>> disp(moms);');
disp(moms);
disp('>>> [a, A] = PH3From5Moments(moms);');
[a, A] = PH3From5Moments(moms);
disp('>>> disp(a);');
disp(a);
disp('>>> disp(A);');
disp(A);
disp('>>> phmoms = MomentsFromME(a, A, 5);');
phmoms = MomentsFromME(a, A, 5);
disp('>>> disp(phmoms);');
disp(phmoms);
disp('=== MEFromMoments ===')
disp('>>> a = [0.1,0.9,0];');
a = [0.1,0.9,0];
disp('>>> A = [-6.2, 2, 0; 2, -9, 1; 1, 0, -3];');
A = [-6.2, 2, 0; 2, -9, 1; 1, 0, -3];
disp('>>> moms = MomentsFromPH(a, A, 5);');
moms = MomentsFromPH(a, A, 5);
disp('>>> disp(moms);');
disp(moms);
disp('>>> [a, A] = MEFromMoments(moms);');
[a, A] = MEFromMoments(moms);
disp('>>> disp(a);');
disp(a);
disp('>>> disp(A);');
disp(A);
disp('>>> memoms = MomentsFromME(a, A, 5);');
memoms = MomentsFromME(a, A, 5);
disp('>>> disp(memoms);');
disp(memoms);
disp('=== APH2ndMomentLowerBound ===')
disp('>>> mean = 1.9;');
mean = 1.9;
disp('>>> n = 4;');
n = 4;
disp('>>> mom2 = APH2ndMomentLowerBound(mean, n);');
mom2 = APH2ndMomentLowerBound(mean, n);
disp('>>> disp(mom2);');
disp(mom2);
disp('>>> cv2 = mom2/mean^2-1;');
cv2 = mom2/mean^2-1;
disp('>>> disp(1/cv2);');
disp(1/cv2);
disp('=== APH3rdMomentLowerBound ===')
disp('>>> mean = 1.9;');
mean = 1.9;
disp('>>> mom2 = 5;');
mom2 = 5;
disp('>>> n = 3;');
n = 3;
disp('>>> mom3lower = APH3rdMomentLowerBound(mean, mom2, n);');
mom3lower = APH3rdMomentLowerBound(mean, mom2, n);
disp('>>> disp(mom3lower);');
disp(mom3lower);
disp('>>> mom3upper = APH3rdMomentUpperBound(mean, mom2, n);');
mom3upper = APH3rdMomentUpperBound(mean, mom2, n);
disp('>>> disp(mom3upper);');
disp(mom3upper);
disp('>>> mean = 1.9;');
mean = 1.9;
disp('>>> mom2 = 5;');
mom2 = 5;
disp('>>> n = 4;');
n = 4;
disp('>>> mom3lower = APH3rdMomentLowerBound(mean, mom2, n);');
mom3lower = APH3rdMomentLowerBound(mean, mom2, n);
disp('>>> disp(mom3lower);');
disp(mom3lower);
disp('>>> mom3upper = APH3rdMomentUpperBound(mean, mom2, n);');
mom3upper = APH3rdMomentUpperBound(mean, mom2, n);
disp('>>> disp(mom3upper);');
disp(mom3upper);
disp('=== APH3rdMomentUpperBound ===')
disp('>>> mean = 1.9;');
mean = 1.9;
disp('>>> mom2 = 5;');
mom2 = 5;
disp('>>> n = 3;');
n = 3;
disp('>>> mom3lower = APH3rdMomentLowerBound(mean, mom2, n);');
mom3lower = APH3rdMomentLowerBound(mean, mom2, n);
disp('>>> disp(mom3lower);');
disp(mom3lower);
disp('>>> mom3upper = APH3rdMomentUpperBound(mean, mom2, n);');
mom3upper = APH3rdMomentUpperBound(mean, mom2, n);
disp('>>> disp(mom3upper);');
disp(mom3upper);
disp('>>> mean = 1.9;');
mean = 1.9;
disp('>>> mom2 = 5;');
mom2 = 5;
disp('>>> n = 4;');
n = 4;
disp('>>> mom3lower = APH3rdMomentLowerBound(mean, mom2, n);');
mom3lower = APH3rdMomentLowerBound(mean, mom2, n);
disp('>>> disp(mom3lower);');
disp(mom3lower);
disp('>>> mom3upper = APH3rdMomentUpperBound(mean, mom2, n);');
mom3upper = APH3rdMomentUpperBound(mean, mom2, n);
disp('>>> disp(mom3upper);');
disp(mom3upper);
disp('=== CanonicalFromPH2 ===')
disp('>>> a = [0.12,0.88];');
a = [0.12,0.88];
disp('>>> A = [-1.28, 0; 3.94, -3.94];');
A = [-1.28, 0; 3.94, -3.94];
disp('>>> [b, B] = CanonicalFromPH2(a, A);');
[b, B] = CanonicalFromPH2(a, A);
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> Cm = SimilarityMatrix(A, B);');
Cm = SimilarityMatrix(A, B);
disp('>>> err1 = norm(A*Cm-Cm*B);');
err1 = norm(A*Cm-Cm*B);
disp('>>> err2 = norm(a*Cm-b);');
err2 = norm(a*Cm-b);
disp('>>> disp(max(err1, err2));');
disp(max(err1, err2));
disp('=== CanonicalFromPH3 ===')
disp('>>> a = [0.1,0.9,0];');
a = [0.1,0.9,0];
disp('>>> A = [-6.2, 2, 0; 2, -9, 1; 1, 0, -3];');
A = [-6.2, 2, 0; 2, -9, 1; 1, 0, -3];
disp('>>> [b, B] = CanonicalFromPH3(a, A);');
[b, B] = CanonicalFromPH3(a, A);
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> Cm = SimilarityMatrix(A, B);');
Cm = SimilarityMatrix(A, B);
disp('>>> err1 = norm(A*Cm-Cm*B);');
err1 = norm(A*Cm-Cm*B);
disp('>>> err2 = norm(a*Cm-b);');
err2 = norm(a*Cm-b);
disp('>>> disp(max(err1, err2));');
disp(max(err1, err2));
disp('=== AcyclicPHFromME ===')
disp('>>> a = [-0.4,1.4,0.];');
a = [-0.4,1.4,0.];
disp('>>> A = [-4., 1., 1.; 0., -2., 1.; 1., 0., -8.];');
A = [-4., 1., 1.; 0., -2., 1.; 1., 0., -8.];
disp('>>> [b, B] = AcyclicPHFromME(a, A);');
[b, B] = AcyclicPHFromME(a, A);
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> ma = MomentsFromME(a, A, 5);');
ma = MomentsFromME(a, A, 5);
disp('>>> disp(ma);');
disp(ma);
disp('>>> mb = MomentsFromME(b, B, 5);');
mb = MomentsFromME(b, B, 5);
disp('>>> disp(mb);');
disp(mb);
disp('=== MonocyclicPHFromME ===')
disp('>>> a = [0.2,0.3,0.5];');
a = [0.2,0.3,0.5];
disp('>>> A = [-1., 0., 0.; 0., -3., 2.; 0., -2., -3.];');
A = [-1., 0., 0.; 0., -3., 2.; 0., -2., -3.];
disp('>>> [b, B] = MonocyclicPHFromME(a, A);');
[b, B] = MonocyclicPHFromME(a, A);
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> ma = MomentsFromME(a, A, 5);');
ma = MomentsFromME(a, A, 5);
disp('>>> disp(ma);');
disp(ma);
disp('>>> mb = MomentsFromME(b, B, 5);');
mb = MomentsFromME(b, B, 5);
disp('>>> disp(mb);');
disp(mb);
disp('=== PHFromME ===')
disp('>>> a = [-0.4,1.4];');
a = [-0.4,1.4];
disp('>>> A = [-3.8, 2; 2, -9];');
A = [-3.8, 2; 2, -9];
disp('>>> flag = CheckMERepresentation(a, A);');
flag = CheckMERepresentation(a, A);
disp('>>> disp(flag);');
disp(flag);
disp('>>> flag = CheckPHRepresentation(a, A);');
flag = CheckPHRepresentation(a, A);
disp('>>> disp(flag);');
disp(flag);
disp('>>> [b, B] = PHFromME(a, A);');
[b, B] = PHFromME(a, A);
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> flag = CheckPHRepresentation(b, B);');
flag = CheckPHRepresentation(b, B);
disp('>>> disp(flag);');
disp(flag);
disp('>>> Cm = SimilarityMatrix(A, B);');
Cm = SimilarityMatrix(A, B);
disp('>>> err1 = norm(A*Cm-Cm*B);');
err1 = norm(A*Cm-Cm*B);
disp('>>> err2 = norm(a*Cm-b);');
err2 = norm(a*Cm-b);
disp('>>> disp(max(err1, err2));');
disp(max(err1, err2));
disp('>>> a = [-0.5,1.5];');
a = [-0.5,1.5];
disp('>>> A = [-3.8, 2; 2, -9];');
A = [-3.8, 2; 2, -9];
disp('>>> flag = CheckMERepresentation(a, A);');
flag = CheckMERepresentation(a, A);
disp('>>> disp(flag);');
disp(flag);
disp('>>> flag = CheckPHRepresentation(a, A);');
flag = CheckPHRepresentation(a, A);
disp('>>> disp(flag);');
disp(flag);
disp('>>> [b, B] = PHFromME(a, A);');
[b, B] = PHFromME(a, A);
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> flag = CheckPHRepresentation(b, B);');
flag = CheckPHRepresentation(b, B);
disp('>>> disp(flag);');
disp(flag);
disp('>>> Cm = SimilarityMatrix(A, B);');
Cm = SimilarityMatrix(A, B);
disp('>>> err1 = norm(A*Cm-Cm*B);');
err1 = norm(A*Cm-Cm*B);
disp('>>> err2 = norm(a*Cm-b);');
err2 = norm(a*Cm-b);
disp('>>> disp(max(err1, err2));');
disp(max(err1, err2));
disp('=== MEOrder ===')
disp('>>> a = [1.0/6,1.0/6,1.0/6,1.0/6,1.0/6,1.0/6];');
a = [1.0/6,1.0/6,1.0/6,1.0/6,1.0/6,1.0/6];
disp('>>> A = [-1., 0., 0., 0., 0., 0.; 0.5, -2., 1., 0., 0., 0.; 1., 0., -3., 1., 0., 0.; 1., 0., 1., -4., 1., 0.; 4., 0., 0., 0., -5., 0.; 5., 0., 0., 0., 0., -6.];');
A = [-1., 0., 0., 0., 0., 0.; 0.5, -2., 1., 0., 0., 0.; 1., 0., -3., 1., 0., 0.; 1., 0., 1., -4., 1., 0.; 4., 0., 0., 0., -5., 0.; 5., 0., 0., 0., 0., -6.];
disp('>>> co = MEOrder(a, A, ''cont'');');
co = MEOrder(a, A, 'cont');
disp('>>> disp(co);');
disp(co);
disp('>>> oo = MEOrder(a, A, ''obs'');');
oo = MEOrder(a, A, 'obs');
disp('>>> disp(oo);');
disp(oo);
disp('>>> coo = MEOrder(a, A, ''obscont'');');
coo = MEOrder(a, A, 'obscont');
disp('>>> disp(coo);');
disp(coo);
disp('>>> mo = MEOrder(a, A, ''moment'');');
mo = MEOrder(a, A, 'moment');
disp('>>> disp(mo);');
disp(mo);
disp('>>> a = [2.0/3,1.0/3];');
a = [2.0/3,1.0/3];
disp('>>> A = [-1., 1.; 0., -3.];');
A = [-1., 1.; 0., -3.];
disp('>>> co = MEOrder(a, A, ''cont'');');
co = MEOrder(a, A, 'cont');
disp('>>> disp(co);');
disp(co);
disp('>>> oo = MEOrder(a, A, ''obs'');');
oo = MEOrder(a, A, 'obs');
disp('>>> disp(oo);');
disp(oo);
disp('>>> coo = MEOrder(a, A, ''obscont'');');
coo = MEOrder(a, A, 'obscont');
disp('>>> disp(coo);');
disp(coo);
disp('>>> mo = MEOrder(a, A, ''moment'');');
mo = MEOrder(a, A, 'moment');
disp('>>> disp(mo);');
disp(mo);
disp('>>> b = [0.2,0.3,0.5];');
b = [0.2,0.3,0.5];
disp('>>> B = [-1., 0., 0.; 0., -3., 1.; 0., -1., -3.];');
B = [-1., 0., 0.; 0., -3., 1.; 0., -1., -3.];
disp('>>> [a, A] = MonocyclicPHFromME(b, B);');
[a, A] = MonocyclicPHFromME(b, B);
disp('>>> disp(a);');
disp(a);
disp('>>> disp(A);');
disp(A);
disp('>>> co = MEOrder(a, A, ''cont'');');
co = MEOrder(a, A, 'cont');
disp('>>> disp(co);');
disp(co);
disp('>>> oo = MEOrder(a, A, ''obs'');');
oo = MEOrder(a, A, 'obs');
disp('>>> disp(oo);');
disp(oo);
disp('>>> coo = MEOrder(a, A, ''obscont'');');
coo = MEOrder(a, A, 'obscont');
disp('>>> disp(coo);');
disp(coo);
disp('>>> mo = MEOrder(a, A, ''moment'');');
mo = MEOrder(a, A, 'moment');
disp('>>> disp(mo);');
disp(mo);
disp('=== MEOrderFromMoments ===')
disp('>>> a = [0.1,0.9,0];');
a = [0.1,0.9,0];
disp('>>> A = [-6.2, 2., 0.; 2., -9., 1.; 1., 0., -3.];');
A = [-6.2, 2., 0.; 2., -9., 1.; 1., 0., -3.];
disp('>>> moms = MomentsFromME(a, A);');
moms = MomentsFromME(a, A);
disp('>>> disp(moms);');
disp(moms);
disp('>>> mo = MEOrderFromMoments(moms);');
mo = MEOrderFromMoments(moms);
disp('>>> disp(mo);');
disp(mo);
disp('>>> b = [0.2,0.3,0.5];');
b = [0.2,0.3,0.5];
disp('>>> B = [-1., 0., 0.; 0., -3., 2.; 0., -2., -3.];');
B = [-1., 0., 0.; 0., -3., 2.; 0., -2., -3.];
disp('>>> [a, A] = MonocyclicPHFromME(b, B);');
[a, A] = MonocyclicPHFromME(b, B);
disp('>>> moms = MomentsFromME(a, A);');
moms = MomentsFromME(a, A);
disp('>>> disp(moms);');
disp(moms);
disp('>>> mo = MEOrderFromMoments(moms);');
mo = MEOrderFromMoments(moms);
disp('>>> disp(mo);');
disp(mo);
disp('=== MinimalRepFromME ===')
disp('>>> a = [1.0/6,1.0/6,1.0/6,1.0/6,1.0/6,1.0/6];');
a = [1.0/6,1.0/6,1.0/6,1.0/6,1.0/6,1.0/6];
disp('>>> A = [-1., 0., 0., 0., 0., 0.; 0.5, -2., 1., 0., 0., 0.; 1., 0., -3., 1., 0., 0.; 1., 0., 1., -4., 1., 0.; 4., 0., 0., 0., -5., 0.; 5., 0., 0., 0., 0., -6.];');
A = [-1., 0., 0., 0., 0., 0.; 0.5, -2., 1., 0., 0., 0.; 1., 0., -3., 1., 0., 0.; 1., 0., 1., -4., 1., 0.; 4., 0., 0., 0., -5., 0.; 5., 0., 0., 0., 0., -6.];
disp('>>> [b, B] = MinimalRepFromME(a, A, ''cont'');');
[b, B] = MinimalRepFromME(a, A, 'cont');
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> [b, B] = MinimalRepFromME(a, A, ''obs'');');
[b, B] = MinimalRepFromME(a, A, 'obs');
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> [b, B] = MinimalRepFromME(a, A, ''obscont'');');
[b, B] = MinimalRepFromME(a, A, 'obscont');
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> [b, B] = MinimalRepFromME(a, A, ''moment'');');
[b, B] = MinimalRepFromME(a, A, 'moment');
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> a = [2.0/3,1.0/3];');
a = [2.0/3,1.0/3];
disp('>>> A = [-1., 1.; 0., -3.];');
A = [-1., 1.; 0., -3.];
disp('>>> [b, B] = MinimalRepFromME(a, A, ''cont'');');
[b, B] = MinimalRepFromME(a, A, 'cont');
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> [b, B] = MinimalRepFromME(a, A, ''obs'');');
[b, B] = MinimalRepFromME(a, A, 'obs');
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> [b, B] = MinimalRepFromME(a, A, ''obscont'');');
[b, B] = MinimalRepFromME(a, A, 'obscont');
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> [b, B] = MinimalRepFromME(a, A, ''moment'');');
[b, B] = MinimalRepFromME(a, A, 'moment');
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> b = [0.2,0.3,0.5];');
b = [0.2,0.3,0.5];
disp('>>> B = [-1., 0., 0.; 0., -3., 1.; 0., -1., -3.];');
B = [-1., 0., 0.; 0., -3., 1.; 0., -1., -3.];
disp('>>> [a, A] = MonocyclicPHFromME(b, B);');
[a, A] = MonocyclicPHFromME(b, B);
disp('>>> disp(a);');
disp(a);
disp('>>> disp(A);');
disp(A);
disp('>>> [b, B] = MinimalRepFromME(a, A, ''cont'');');
[b, B] = MinimalRepFromME(a, A, 'cont');
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> [b, B] = MinimalRepFromME(a, A, ''obs'');');
[b, B] = MinimalRepFromME(a, A, 'obs');
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> Cm = SimilarityMatrix(B, A);');
Cm = SimilarityMatrix(B, A);
disp('>>> err1 = norm(B*Cm-Cm*A);');
err1 = norm(B*Cm-Cm*A);
disp('>>> err2 = norm(b*Cm-a);');
err2 = norm(b*Cm-a);
disp('>>> disp(max(err1, err2));');
disp(max(err1, err2));
disp('>>> [b, B] = MinimalRepFromME(a, A, ''obscont'');');
[b, B] = MinimalRepFromME(a, A, 'obscont');
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> Cm = SimilarityMatrix(B, A);');
Cm = SimilarityMatrix(B, A);
disp('>>> err1 = norm(B*Cm-Cm*A);');
err1 = norm(B*Cm-Cm*A);
disp('>>> err2 = norm(b*Cm-a);');
err2 = norm(b*Cm-a);
disp('>>> disp(max(err1, err2));');
disp(max(err1, err2));
disp('>>> [b, B] = MinimalRepFromME(a, A, ''moment'');');
[b, B] = MinimalRepFromME(a, A, 'moment');
disp('>>> disp(b);');
disp(b);
disp('>>> disp(B);');
disp(B);
disp('>>> Cm = SimilarityMatrix(B, A);');
Cm = SimilarityMatrix(B, A);
disp('>>> err1 = norm(B*Cm-Cm*A);');
err1 = norm(B*Cm-Cm*A);
disp('>>> err2 = norm(b*Cm-a);');
err2 = norm(b*Cm-a);
disp('>>> disp(max(err1, err2));');
disp(max(err1, err2));
disp('=== SamplesFromPH ===')
disp('>>> a = [0.1,0.9,0];');
a = [0.1,0.9,0];
disp('>>> A = [-6.2, 2, 0; 2, -9, 1; 1, 0, -3];');
A = [-6.2, 2, 0; 2, -9, 1; 1, 0, -3];
disp('>>> x = SamplesFromPH(a, A, 1000);');
x = SamplesFromPH(a, A, 1000);
disp('>>> mt = MarginalMomentsFromTrace(x, 3);');
mt = MarginalMomentsFromTrace(x, 3);
disp('>>> disp(mt);');
disp(mt);
disp('>>> mp = MomentsFromPH(a, A, 3);');
mp = MomentsFromPH(a, A, 3);
disp('>>> disp(mp);');
disp(mp);

