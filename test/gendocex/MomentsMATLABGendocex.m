function MomentsMatlabGendocex ()
	disp('---BuTools: Moments package test file---');
	disp('Enable the verbose messages with the BuToolsVerbose flag');
	global BuToolsVerbose;
	BuToolsVerbose = true;
	disp('Enable input parameter checking with the BuToolsCheckInput flag');
	global BuToolsCheckInput;
	BuToolsCheckInput = true;
	format compact
	diary('Moments_matlab.docex');
	disp('=== NormMomsFromMoms ===');
	disp('>>> M = [1.2, 5, 38, 495, 9215];');
	M = [1.2, 5, 38, 495, 9215];
	disp('>>> nmoms = NormMomsFromMoms(M);');
	nmoms = NormMomsFromMoms(M);
	disp('>>> disp(nmoms);');
	disp(nmoms);
	disp('>>> moms = MomsFromNormMoms(nmoms);');
	moms = MomsFromNormMoms(nmoms);
	disp('>>> disp(moms);');
	disp(moms);
	disp('>>> err = norm(moms-M);');
	err = norm(moms-M);
	disp('>>> disp(err);');
	disp(err);
	disp('=== MomsFromNormMoms ===');
	disp('>>> M = [1.2, 5, 38, 495, 9215];');
	M = [1.2, 5, 38, 495, 9215];
	disp('>>> nmoms = NormMomsFromMoms(M);');
	nmoms = NormMomsFromMoms(M);
	disp('>>> disp(nmoms);');
	disp(nmoms);
	disp('>>> moms = MomsFromNormMoms(nmoms);');
	moms = MomsFromNormMoms(nmoms);
	disp('>>> disp(moms);');
	disp(moms);
	disp('>>> err = norm(moms-M);');
	err = norm(moms-M);
	disp('>>> disp(err);');
	disp(err);
	disp('=== ReducedMomsFromMoms ===');
	disp('>>> M = [1.2, 5, 38, 495, 9215];');
	M = [1.2, 5, 38, 495, 9215];
	disp('>>> rmoms = ReducedMomsFromMoms(M);');
	rmoms = ReducedMomsFromMoms(M);
	disp('>>> disp(rmoms);');
	disp(rmoms);
	disp('>>> moms = MomsFromReducedMoms(rmoms);');
	moms = MomsFromReducedMoms(rmoms);
	disp('>>> disp(moms);');
	disp(moms);
	disp('>>> err = norm(moms-M);');
	err = norm(moms-M);
	disp('>>> disp(err);');
	disp(err);
	disp('=== MomsFromReducedMoms ===');
	disp('>>> M = [1.2, 5, 38, 495, 9215];');
	M = [1.2, 5, 38, 495, 9215];
	disp('>>> rmoms = ReducedMomsFromMoms(M);');
	rmoms = ReducedMomsFromMoms(M);
	disp('>>> disp(rmoms);');
	disp(rmoms);
	disp('>>> moms = MomsFromReducedMoms(rmoms);');
	moms = MomsFromReducedMoms(rmoms);
	disp('>>> disp(moms);');
	disp(moms);
	disp('>>> err = norm(moms-M);');
	err = norm(moms-M);
	disp('>>> disp(err);');
	disp(err);
	disp('=== FactorialMomsFromMoms ===');
	disp('>>> M = [1.3, 2.4, 6.03, 20.5, 89.5, 474.9];');
	M = [1.3, 2.4, 6.03, 20.5, 89.5, 474.9];
	disp('>>> fmoms = FactorialMomsFromMoms(M);');
	fmoms = FactorialMomsFromMoms(M);
	disp('>>> disp(fmoms);');
	disp(fmoms);
	disp('>>> moms = MomsFromFactorialMoms(fmoms);');
	moms = MomsFromFactorialMoms(fmoms);
	disp('>>> disp(moms);');
	disp(moms);
	disp('>>> err = norm(moms-M);');
	err = norm(moms-M);
	disp('>>> disp(err);');
	disp(err);
	disp('=== MomsFromFactorialMoms ===');
	disp('>>> M = [1.3, 2.4, 6.03, 20.5, 89.5, 474.9];');
	M = [1.3, 2.4, 6.03, 20.5, 89.5, 474.9];
	disp('>>> fmoms = FactorialMomsFromMoms(M);');
	fmoms = FactorialMomsFromMoms(M);
	disp('>>> disp(fmoms);');
	disp(fmoms);
	disp('>>> moms = MomsFromFactorialMoms(fmoms);');
	moms = MomsFromFactorialMoms(fmoms);
	disp('>>> disp(moms);');
	disp(moms);
	disp('>>> err = norm(moms-M);');
	err = norm(moms-M);
	disp('>>> disp(err);');
	disp(err);
	disp('=== JFactorialMomsFromJMoms ===');
	disp('>>> MM = [0.7, 2, 3, 4; 5, 6, 7, 8; 9, 10, 11, 12];');
	MM = [0.7, 2, 3, 4; 5, 6, 7, 8; 9, 10, 11, 12];
	disp('>>> JFmoms = JFactorialMomsFromJMoms(MM);');
	JFmoms = JFactorialMomsFromJMoms(MM);
	disp('>>> disp(JFmoms);');
	disp(JFmoms);
	disp('>>> Jmoms = JMomsFromJFactorialMoms(JFmoms);');
	Jmoms = JMomsFromJFactorialMoms(JFmoms);
	disp('>>> disp(Jmoms);');
	disp(Jmoms);
	disp('>>> err = norm(Jmoms-MM);');
	err = norm(Jmoms-MM);
	disp('>>> disp(err);');
	disp(err);
	disp('=== JMomsFromJFactorialMoms ===');
	disp('>>> MM = [0.7, 2, 3, 4; 5, 6, 7, 8; 9, 10, 11, 12];');
	MM = [0.7, 2, 3, 4; 5, 6, 7, 8; 9, 10, 11, 12];
	disp('>>> JFmoms = JFactorialMomsFromJMoms(MM);');
	JFmoms = JFactorialMomsFromJMoms(MM);
	disp('>>> disp(JFmoms);');
	disp(JFmoms);
	disp('>>> Jmoms = JMomsFromJFactorialMoms(JFmoms);');
	Jmoms = JMomsFromJFactorialMoms(JFmoms);
	disp('>>> disp(Jmoms);');
	disp(Jmoms);
	disp('>>> err = norm(Jmoms-MM);');
	err = norm(Jmoms-MM);
	disp('>>> disp(err);');
	disp(err);
	disp('=== HankelMomsFromMoms ===');
	disp('>>> M = [1.3, 2.4, 6.03, 20.5, 89.5, 474.9];');
	M = [1.3, 2.4, 6.03, 20.5, 89.5, 474.9];
	disp('>>> hmoms = HankelMomsFromMoms(M);');
	hmoms = HankelMomsFromMoms(M);
	disp('>>> disp(hmoms);');
	disp(hmoms);
	disp('>>> moms = MomsFromHankelMoms(hmoms);');
	moms = MomsFromHankelMoms(hmoms);
	disp('>>> disp(moms);');
	disp(moms);
	disp('>>> err = norm(moms-M);');
	err = norm(moms-M);
	disp('>>> disp(err);');
	disp(err);
	disp('=== MomsFromHankelMoms ===');
	disp('>>> M = [1.3, 2.4, 6.03, 20.5, 89.5, 474.9];');
	M = [1.3, 2.4, 6.03, 20.5, 89.5, 474.9];
	disp('>>> hmoms = HankelMomsFromMoms(M);');
	hmoms = HankelMomsFromMoms(M);
	disp('>>> disp(hmoms);');
	disp(hmoms);
	disp('>>> moms = MomsFromHankelMoms(hmoms);');
	moms = MomsFromHankelMoms(hmoms);
	disp('>>> disp(moms);');
	disp(moms);
	disp('>>> err = norm(moms-M);');
	err = norm(moms-M);
	disp('>>> disp(err);');
	disp(err);
	disp('=== CheckMoments ===');
	disp('>>> M = [1.2, 5, 8, 29, 3412];');
	M = [1.2, 5, 8, 29, 3412];
	disp('>>> flag = CheckMoments(M);');
	flag = CheckMoments(M);
	disp('>>> disp(flag);');
	disp(flag);
	disp('>>> M = [1.3, 2.4, 6.03, 20.5, 89.5];');
	M = [1.3, 2.4, 6.03, 20.5, 89.5];
	disp('>>> flag = CheckMoments(M);');
	flag = CheckMoments(M);
	disp('>>> disp(flag);');
	disp(flag);
	diary off;
end