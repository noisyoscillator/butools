ClearAll["Global`*"]
AppendTo[$Path,"/home/gabor/github/butools/Mathematica"];
<<BuTools`
Print["---BuTools: Fitting package test file---"//OutputForm];
Print["Enable the verbose messages with the BuToolsVerbose flag"//OutputForm];
BuTools`Verbose = True;
Print["Enable input parameter checking with the BuToolsCheckInput flag"//OutputForm];
BuTools`CheckInput = true;
On[Assert];
tmpOut = $Output;
stream = OpenWrite["/home/gabor/github/butools/test/docex/Fitting_mathematica.docex", FormatType -> InputForm, PageWidth -> Infinity];
$Output = {stream};
Unprotect[Print];
Print[args___] := Block[{$inMsg = True, result, str},
   If[MatrixQ[args],
       str = "{";
       Do[str = StringJoin[str, ToString[args[[r]], FormatType -> InputForm]]; 
            If[r < Length[args], str = StringJoin[str, ",\n "]], {r, Length[args]}];
            str = StringJoin[str, "}"];
            Print[str//OutputForm],
            result = Print[args],
            result = Print[args]
        ]] /; ! TrueQ[$inMsg];
Print["=== EmpiricalSquaredDifference ==="]
Print[">>> tr = Flatten[Import[\"/home/gabor/github/butools/test/data/bctrace.iat\",\"CSV\"]];"//OutputForm];
tr = Flatten[Import["/home/gabor/github/butools/test/data/bctrace.iat","CSV"]];
Print[">>> intBounds = Array[# &, 50, {0, MarginalMomentsFromTrace[tr, 1][[1]]*4}];"//OutputForm];
intBounds = Array[# &, 50, {0, MarginalMomentsFromTrace[tr, 1][[1]]*4}];
Print[">>> {pdfTrX, pdfTrY} = PdfFromTrace[tr, intBounds];"//OutputForm];
{pdfTrX, pdfTrY} = PdfFromTrace[tr, intBounds];
Print[">>> {cdfTrX, cdfTrY} = CdfFromTrace[tr];"//OutputForm];
{cdfTrX, cdfTrY} = CdfFromTrace[tr];
Print[">>> step = Ceiling[Length[tr]/2000];"//OutputForm];
step = Ceiling[Length[tr]/2000];
Print[">>> cdfTrX = cdfTrX[[1;;Length[tr];;step]];"//OutputForm];
cdfTrX = cdfTrX[[1;;Length[tr];;step]];
Print[">>> cdfTrY = cdfTrY[[1;;Length[tr];;step]];"//OutputForm];
cdfTrY = cdfTrY[[1;;Length[tr];;step]];
Print[">>> {alpha, A} = APHFrom3Moments[MarginalMomentsFromTrace[tr, 3]];"//OutputForm];
{alpha, A} = APHFrom3Moments[MarginalMomentsFromTrace[tr, 3]];
Print[">>> {pdfPHX, pdfPHY} = IntervalPdfFromPH[alpha, A, intBounds];"//OutputForm];
{pdfPHX, pdfPHY} = IntervalPdfFromPH[alpha, A, intBounds];
Print[">>> cdfPHY = CdfFromPH[alpha, A, cdfTrX];"//OutputForm];
cdfPHY = CdfFromPH[alpha, A, cdfTrX];
Print[">>> sqPdf = EmpiricalSquaredDifference[pdfTrY, pdfPHY, intBounds];"//OutputForm];
sqPdf = EmpiricalSquaredDifference[pdfTrY, pdfPHY, intBounds];
Print[">>> Print[sqPdf];"//OutputForm];
Print[sqPdf];
Print[">>> sqCdf = EmpiricalSquaredDifference[cdfTrY[[1;;-2]], cdfPHY[[1;;-2]], cdfTrX];"//OutputForm];
sqCdf = EmpiricalSquaredDifference[cdfTrY[[1;;-2]], cdfPHY[[1;;-2]], cdfTrX];
Print[">>> Print[sqCdf];"//OutputForm];
Print[sqCdf];
Print["=== EmpiricalRelativeEntropy ==="]
Print[">>> tr = Flatten[Import[\"/home/gabor/github/butools/test/data/bctrace.iat\",\"CSV\"]];"//OutputForm];
tr = Flatten[Import["/home/gabor/github/butools/test/data/bctrace.iat","CSV"]];
Print[">>> intBounds = Array[# &, 50, {0, MarginalMomentsFromTrace[tr, 1][[1]]*4}];"//OutputForm];
intBounds = Array[# &, 50, {0, MarginalMomentsFromTrace[tr, 1][[1]]*4}];
Print[">>> {pdfTrX, pdfTrY} = PdfFromTrace[tr, intBounds];"//OutputForm];
{pdfTrX, pdfTrY} = PdfFromTrace[tr, intBounds];
Print[">>> {cdfTrX, cdfTrY} = CdfFromTrace[tr];"//OutputForm];
{cdfTrX, cdfTrY} = CdfFromTrace[tr];
Print[">>> step = Ceiling[Length[tr]/2000];"//OutputForm];
step = Ceiling[Length[tr]/2000];
Print[">>> cdfTrX = cdfTrX[[1;;Length[tr];;step]];"//OutputForm];
cdfTrX = cdfTrX[[1;;Length[tr];;step]];
Print[">>> cdfTrY = cdfTrY[[1;;Length[tr];;step]];"//OutputForm];
cdfTrY = cdfTrY[[1;;Length[tr];;step]];
Print[">>> {alpha, A} = APHFrom3Moments[MarginalMomentsFromTrace[tr, 3]];"//OutputForm];
{alpha, A} = APHFrom3Moments[MarginalMomentsFromTrace[tr, 3]];
Print[">>> {pdfPHX, pdfPHY} = IntervalPdfFromPH[alpha, A, intBounds];"//OutputForm];
{pdfPHX, pdfPHY} = IntervalPdfFromPH[alpha, A, intBounds];
Print[">>> cdfPHY = CdfFromPH[alpha, A, cdfTrX];"//OutputForm];
cdfPHY = CdfFromPH[alpha, A, cdfTrX];
Print[">>> rePdf = EmpiricalRelativeEntropy[pdfTrY, pdfPHY, intBounds];"//OutputForm];
rePdf = EmpiricalRelativeEntropy[pdfTrY, pdfPHY, intBounds];
Print[">>> Print[rePdf];"//OutputForm];
Print[rePdf];
Print[">>> reCdf = EmpiricalRelativeEntropy[cdfTrY[[1;;-2]], cdfPHY[[1;;-2]], cdfTrX];"//OutputForm];
reCdf = EmpiricalRelativeEntropy[cdfTrY[[1;;-2]], cdfPHY[[1;;-2]], cdfTrX];
Print[">>> Print[reCdf];"//OutputForm];
Print[reCdf];
Print["=== LikelihoodFromTrace ==="]
Print[">>> tr = Flatten[Import[\"/home/gabor/github/butools/test/data/bctrace.iat\",\"CSV\"]];"//OutputForm];
tr = Flatten[Import["/home/gabor/github/butools/test/data/bctrace.iat","CSV"]];
Print[">>> {alpha, A} = APHFrom3Moments[MarginalMomentsFromTrace[tr, 3]];"//OutputForm];
{alpha, A} = APHFrom3Moments[MarginalMomentsFromTrace[tr, 3]];
Print[">>> {D0, D1} = MAPFromFewMomentsAndCorrelations[MarginalMomentsFromTrace[tr, 3], LagCorrelationsFromTrace[tr, 1][[1]]];"//OutputForm];
{D0, D1} = MAPFromFewMomentsAndCorrelations[MarginalMomentsFromTrace[tr, 3], LagCorrelationsFromTrace[tr, 1][[1]]];
Print[">>> logliPH = LikelihoodFromTrace[tr, alpha, A];"//OutputForm];
logliPH = LikelihoodFromTrace[tr, alpha, A];
Print[">>> Print[logliPH];"//OutputForm];
Print[logliPH];
Print[">>> logliMAP = LikelihoodFromTrace[tr, D0, D1];"//OutputForm];
logliMAP = LikelihoodFromTrace[tr, D0, D1];
Print[">>> Print[logliMAP];"//OutputForm];
Print[logliMAP];
Print["=== SquaredDifference ==="]
Print[">>> tr = Flatten[Import[\"/home/gabor/github/butools/test/data/bctrace.iat\",\"CSV\"]];"//OutputForm];
tr = Flatten[Import["/home/gabor/github/butools/test/data/bctrace.iat","CSV"]];
Print[">>> trAcf = LagCorrelationsFromTrace[tr, 10];"//OutputForm];
trAcf = LagCorrelationsFromTrace[tr, 10];
Print[">>> Print[trAcf];"//OutputForm];
Print[trAcf];
Print[">>> {D0, D1} = MAPFromFewMomentsAndCorrelations[MarginalMomentsFromTrace[tr, 3], trAcf[[1]]];"//OutputForm];
{D0, D1} = MAPFromFewMomentsAndCorrelations[MarginalMomentsFromTrace[tr, 3], trAcf[[1]]];
Print[">>> mapAcf = LagCorrelationsFromMAP[D0, D1, 10];"//OutputForm];
mapAcf = LagCorrelationsFromMAP[D0, D1, 10];
Print[">>> Print[mapAcf];"//OutputForm];
Print[mapAcf];
Print[">>> sqAcf = SquaredDifference[mapAcf, trAcf];"//OutputForm];
sqAcf = SquaredDifference[mapAcf, trAcf];
Print[">>> Print[sqAcf];"//OutputForm];
Print[sqAcf];
Print["=== RelativeEntropy ==="]
Print[">>> tr = Flatten[Import[\"/home/gabor/github/butools/test/data/bctrace.iat\",\"CSV\"]];"//OutputForm];
tr = Flatten[Import["/home/gabor/github/butools/test/data/bctrace.iat","CSV"]];
Print[">>> trAcf = LagCorrelationsFromTrace[tr, 10];"//OutputForm];
trAcf = LagCorrelationsFromTrace[tr, 10];
Print[">>> Print[trAcf];"//OutputForm];
Print[trAcf];
Print[">>> {D0, D1} = MAPFromFewMomentsAndCorrelations[MarginalMomentsFromTrace[tr, 3], trAcf[[1]]];"//OutputForm];
{D0, D1} = MAPFromFewMomentsAndCorrelations[MarginalMomentsFromTrace[tr, 3], trAcf[[1]]];
Print[">>> mapAcf = LagCorrelationsFromMAP[D0, D1, 10];"//OutputForm];
mapAcf = LagCorrelationsFromMAP[D0, D1, 10];
Print[">>> Print[mapAcf];"//OutputForm];
Print[mapAcf];
Print[">>> reAcf = RelativeEntropy[mapAcf, trAcf];"//OutputForm];
reAcf = RelativeEntropy[mapAcf, trAcf];
Print[">>> Print[reAcf];"//OutputForm];
Print[reAcf];
Print["=== PHFromTrace ==="]
Print[">>> tr = Flatten[Import[\"/home/gabor/github/butools/test/data/bctrace.iat\",\"CSV\"]];"//OutputForm];
tr = Flatten[Import["/home/gabor/github/butools/test/data/bctrace.iat","CSV"]];
Print[">>> {alpha, A, logli} = PHFromTrace[tr, 5];"//OutputForm];
{alpha, A, logli} = PHFromTrace[tr, 5];
Print[">>> Print[alpha];"//OutputForm];
Print[alpha];
Print[">>> Print[A];"//OutputForm];
Print[A];
Print[">>> Print[logli];"//OutputForm];
Print[logli];
Print[">>> logli = LikelihoodFromTrace[tr, alpha, A];"//OutputForm];
logli = LikelihoodFromTrace[tr, alpha, A];
Print[">>> Print[logli];"//OutputForm];
Print[logli];
Print[">>> intBounds = Array[# &, 50, {0, MarginalMomentsFromTrace[tr, 1][[1]]*4}];"//OutputForm];
intBounds = Array[# &, 50, {0, MarginalMomentsFromTrace[tr, 1][[1]]*4}];
Print[">>> {pdfTrX, pdfTrY} = PdfFromTrace[tr, intBounds];"//OutputForm];
{pdfTrX, pdfTrY} = PdfFromTrace[tr, intBounds];
Print[">>> {pdfPHX, pdfPHY} = IntervalPdfFromPH[alpha, A, intBounds];"//OutputForm];
{pdfPHX, pdfPHY} = IntervalPdfFromPH[alpha, A, intBounds];
Print[">>> sqPdf = EmpiricalSquaredDifference[pdfTrY, pdfPHY, intBounds];"//OutputForm];
sqPdf = EmpiricalSquaredDifference[pdfTrY, pdfPHY, intBounds];
Print[">>> Print[sqPdf];"//OutputForm];
Print[sqPdf];
Print[">>> rePdf = EmpiricalRelativeEntropy[pdfTrY, pdfPHY, intBounds];"//OutputForm];
rePdf = EmpiricalRelativeEntropy[pdfTrY, pdfPHY, intBounds];
Print[">>> Print[rePdf];"//OutputForm];
Print[rePdf];
Print[">>> {cdfTrX, cdfTrY} = CdfFromTrace[tr];"//OutputForm];
{cdfTrX, cdfTrY} = CdfFromTrace[tr];
Print[">>> step = Ceiling[Length[tr]/2000];"//OutputForm];
step = Ceiling[Length[tr]/2000];
Print[">>> cdfTrX = cdfTrX[[1;;Length[tr];;step]];"//OutputForm];
cdfTrX = cdfTrX[[1;;Length[tr];;step]];
Print[">>> cdfTrY = cdfTrY[[1;;Length[tr];;step]];"//OutputForm];
cdfTrY = cdfTrY[[1;;Length[tr];;step]];
Print[">>> cdfPHY = CdfFromPH[alpha, A, cdfTrX];"//OutputForm];
cdfPHY = CdfFromPH[alpha, A, cdfTrX];
Print[">>> sqCdf = EmpiricalSquaredDifference[cdfTrY[[1;;-2]], cdfPHY[[1;;-2]], cdfTrX];"//OutputForm];
sqCdf = EmpiricalSquaredDifference[cdfTrY[[1;;-2]], cdfPHY[[1;;-2]], cdfTrX];
Print[">>> Print[sqCdf];"//OutputForm];
Print[sqCdf];
Print[">>> reCdf = EmpiricalRelativeEntropy[cdfTrY[[1;;-2]], cdfPHY[[1;;-2]], cdfTrX];"//OutputForm];
reCdf = EmpiricalRelativeEntropy[cdfTrY[[1;;-2]], cdfPHY[[1;;-2]], cdfTrX];
Print[">>> Print[reCdf];"//OutputForm];
Print[reCdf];
Print["=== MAPFromTrace ==="]
Print[">>> tr = Flatten[Import[\"/home/gabor/github/butools/test/data/bctrace.iat\",\"CSV\"]];"//OutputForm];
tr = Flatten[Import["/home/gabor/github/butools/test/data/bctrace.iat","CSV"]];
Print[">>> tr = tr[[1;;10000]];"//OutputForm];
tr = tr[[1;;10000]];
Print[">>> {D0, D1, logli} = MAPFromTrace[tr, 5];"//OutputForm];
{D0, D1, logli} = MAPFromTrace[tr, 5];
Print[">>> Print[D0];"//OutputForm];
Print[D0];
Print[">>> Print[D1];"//OutputForm];
Print[D1];
Print[">>> Print[logli];"//OutputForm];
Print[logli];
Print[">>> logli = LikelihoodFromTrace[tr, D0, D1];"//OutputForm];
logli = LikelihoodFromTrace[tr, D0, D1];
Print[">>> Print[logli];"//OutputForm];
Print[logli];
Print[">>> trAcf = LagCorrelationsFromTrace[tr, 10];"//OutputForm];
trAcf = LagCorrelationsFromTrace[tr, 10];
Print[">>> Print[trAcf];"//OutputForm];
Print[trAcf];
Print[">>> mapAcf = LagCorrelationsFromMAP[D0, D1, 10];"//OutputForm];
mapAcf = LagCorrelationsFromMAP[D0, D1, 10];
Print[">>> Print[mapAcf];"//OutputForm];
Print[mapAcf];
Print[">>> sqAcf = SquaredDifference[mapAcf, trAcf];"//OutputForm];
sqAcf = SquaredDifference[mapAcf, trAcf];
Print[">>> Print[sqAcf];"//OutputForm];
Print[sqAcf];
Print[">>> reAcf = RelativeEntropy[mapAcf, trAcf];"//OutputForm];
reAcf = RelativeEntropy[mapAcf, trAcf];
Print[">>> Print[reAcf];"//OutputForm];
Print[reAcf];
$Output = tmpOut;Close[stream];

