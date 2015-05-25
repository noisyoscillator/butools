function TestMCPackage ()
	disp('---BuTools: MC package test file---');
	disp('Enable the verbose messages with the BuToolsVerbose flag');
	global BuToolsVerbose;
	BuToolsVerbose = true;
	disp('Enable input parameter checking with the BuToolsCheckInput flag');
	global BuToolsCheckInput;
	BuToolsCheckInput = true;
	disp('========================================')
	help CRPSolve
	disp('Input:');
	disp('------');
	Q = [-4.3, 3.5, 0.8; -8.4, 6.5, 1.9; 17.3, -12.7, -4.6];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('ret = CRPSolve(Q):');
	ret = CRPSolve(Q);
	disp('ret = ');
	disp(ret);
	disp('ret*Q:');
	disp(ret*Q);
	assert(norm(ret*Q)<10^-12 , 'The solution does not satisfy ret*Q=0!');
	disp('========================================')
	help DRPSolve
	disp('Input:');
	disp('------');
	Q = [-0.9, 0.5, 1.4; 0.9, -0.9, 1; 0.3, 1.3, -0.6];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('ret = DRPSolve(Q):');
	ret = DRPSolve(Q);
	disp('ret = ');
	disp(ret);
	disp('ret*Q - ret:');
	disp(ret*Q - ret);
	assert(norm(ret*Q-ret)<10^-12 , 'The solution does not satisfy ret*Q=ret!');
	disp('========================================')
	help CTMCSolve
	disp('Input:');
	disp('------');
	Q = [-0.9, 0.5, 0.4; 0.9, -0.9, 0; 0.3, 0.3, -0.6];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('ret = CTMCSolve(Q):');
	ret = CTMCSolve(Q);
	disp('ret = ');
	disp(ret);
	disp('ret*Q:');
	disp(ret*Q);
	assert(norm(ret*Q)<10^-12 , 'The solution does not satisfy ret*Q=0!');
	disp('========================================')
	help DTMCSolve
	Q = [0.1, 0.5, 0.4; 0.9, 0.1, 0; 0.3, 0.3, 0.4];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('ret = DTMCSolve(Q):');
	ret = DTMCSolve(Q);
	disp('ret = ');
	disp(ret);
	disp('ret*Q - ret:');
	disp(ret*Q - ret);
	assert(norm(ret*Q-ret)<10^-12 , 'The solution does not satisfy ret*Q=ret!');
	disp('========================================')
	help CheckGenerator
	disp('Input:');
	disp('------');
	Q = [-0.9, 0.2, 0.4; 0, 0.9, 0.9; 0, 0.6, -0.6];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('flag = CheckGenerator(Q,true):');
	flag = CheckGenerator(Q,true);
	disp('flag = ');
	disp(flag);
	assert(flag==false , 'CheckGenerator did not detect bad row sum!');
	disp('Input:');
	disp('------');
	Q = [-0.9, 0.5, 0.4; 0.9, -0.9, 0; 0.3, 0.3, -0.6];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('flag = CheckGenerator(Q,true):');
	flag = CheckGenerator(Q,true);
	disp('flag = ');
	disp(flag);
	assert(flag==true , 'CheckGenerator did not recognize a valid input!');
	disp('Input:');
	disp('------');
	Q = [-0.9, 0.2, 0.4; 0.9, -0.9, 0; 0.3, 0.3, -0.6];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('flag = CheckGenerator(Q,true):');
	flag = CheckGenerator(Q,true);
	disp('flag = ');
	disp(flag);
	assert(flag==true , 'CheckGenerator did not recognize a valid input!');
	disp('Input:');
	disp('------');
	Q = [-0.9, 0.5, 0.4; 0.9, -1.1, 0; 0.3, 0.3, -0.6];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('flag = CheckGenerator(Q):');
	flag = CheckGenerator(Q);
	disp('flag = ');
	disp(flag);
	assert(flag==false , 'CheckGenerator did not recognize the non-zero row sum!');
	disp('Input:');
	disp('------');
	Q = [-0.9, 0.5, 0.4; 0.9, -0.9, 0; 0.3, 0.3, -0.6];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('flag = CheckGenerator(Q):');
	flag = CheckGenerator(Q);
	disp('flag = ');
	disp(flag);
	assert(flag==true , 'CheckGenerator did not recognize a valid input!');
	disp('========================================')
	help CheckProbMatrix
	disp('Input:');
	disp('------');
	Q = [0.1, 0.5, 0.4; 0.9, 0.1, 0; 0.3, -0.1, 0.4];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('flag = CheckProbMatrix(Q):');
	flag = CheckProbMatrix(Q);
	disp('flag = ');
	disp(flag);
	assert(flag==false , 'CheckProbMatrix did not recognize the negative entry!');
	disp('Input:');
	disp('------');
	Q = [0.1, 0.5, 0.4; 0.9, 0.1, 0; 0.3, 0.1, 0.4];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('flag = CheckProbMatrix(Q):');
	flag = CheckProbMatrix(Q);
	disp('flag = ');
	disp(flag);
	assert(flag==false , 'CheckProbMatrix did not recognize the invalid row sum!');
	disp('Input:');
	disp('------');
	Q = [0.1, 0.5, 0.4; 0.9, 0.1, 0; 0.3, 0.3, 0.4];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('flag = CheckProbMatrix(Q):');
	flag = CheckProbMatrix(Q);
	disp('flag = ');
	disp(flag);
	assert(flag==true , 'CheckProbMatrix did not recognize that the input is valid!');
	disp('Input:');
	disp('------');
	Q = [0.1, 0.5, 0.4; 0.9, 0.1, 0; 0.3, 0.3, 0.4];
	disp('Test:');
	disp('-----');
	disp('flag = CheckProbMatrix(Q,true):');
	flag = CheckProbMatrix(Q,true);
	disp('flag = ');
	disp(flag);
	assert(flag==false , 'CheckProbMatrix did not recognize wrong transient matrix!');
	disp('Input:');
	disp('------');
	Q = [0.1, 0.5, 0.4; 0.9, 0.1, 0; 0.3, 0.1, 0.4];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('flag = CheckProbMatrix(Q,true):');
	flag = CheckProbMatrix(Q,true);
	disp('flag = ');
	disp(flag);
	assert(flag==true , 'CheckProbMatrix did not recognize that the input is valid!');
	disp('========================================')
	help CheckProbVector
	disp('Input:');
	disp('------');
	Q = [1.1, -0.1];
	disp('Test:');
	disp('-----');
	disp('flag = CheckProbVector(Q):');
	flag = CheckProbVector(Q);
	disp('flag = ');
	disp(flag);
	assert(flag==false , 'CheckProbVector did not recognize the negative entry!');
	disp('Input:');
	disp('------');
	Q = [1.1, 0.1];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('flag = CheckProbVector(Q):');
	flag = CheckProbVector(Q);
	disp('flag = ');
	disp(flag);
	assert(flag==false , 'CheckProbVector did not recognize invalid sum!');
	disp('Input:');
	disp('------');
	Q = [1, 0];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('flag = CheckProbVector(Q):');
	flag = CheckProbVector(Q);
	disp('flag = ');
	disp(flag);
	assert(flag==true , 'CheckProbVector did not recognize that the input is valid!');
	disp('Input:');
	disp('------');
	Q = [0.9, -0.1];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('flag = CheckProbVector(Q,true):');
	flag = CheckProbVector(Q,true);
	disp('flag = ');
	disp(flag);
	assert(flag==false , 'CheckProbVector did not recognize the negative entry!');
	disp('Input:');
	disp('------');
	Q = [0.9, 0.1];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('flag = CheckProbVector(Q,true):');
	flag = CheckProbVector(Q,true);
	disp('flag = ');
	disp(flag);
	assert(flag==true , 'CheckProbVector did not recognize that the prob. vector is not transient!');
	disp('Input:');
	disp('------');
	Q = [0.8, 0.1];
	disp('Q = ');
	disp(Q);
	disp('Test:');
	disp('-----');
	disp('flag = CheckProbVector(Q,true):');
	flag = CheckProbVector(Q,true);
	disp('flag = ');
	disp(flag);
	assert(flag==true , 'CheckProbVector did not recognize that the input is valid!');
end
