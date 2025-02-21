function mpc = case5_dcgrid()
%% MATPOWER Case Format : Version 1
%%-----  Power Flow Data  -----%%
%% system MVA base
mpc.baseMVA = 100;

%% bus data
%	bus_i	type	Pd	Qd	Gs	Bs	area	Vm      Va	baseKV	zone	Vmax	Vmin
mpc.bus = [
1       3       0	0	0   0   1       1	0	345     1       1.1     0.9;
2       3       0	0	0   0   1       1	0	345     1       1.1     0.9;
];

%% generator data
%	bus	Pg      Qg	Qmax	Qmin	Vg	mBase       status	Pmax	Pmin	pc1 pc2 qlcmin qlcmax qc2min qc2max ramp_agc ramp_10 ramp_30 ramp_q apf
mpc.gen = [
	1	0       0	500      -500    1	100       1       100     0 0 0 0 0 0 0 0 0 0 0 0;
	2	0       0	500      -500    1	100       1       100     0 0 0 0 0 0 0 0 0 0 0 0;
];

%% branch data
%	fbus	tbus	r	x	b	rateA	rateB	rateC	ratio	angle	status angmin angmax
mpc.branch = [
        1   2   0.02    0.06    0.06    100   100   100     0       0       0 -60 60;
];

%column_names% 				prob    branch_id1 	 branch_id2 	branch_id3 		dcbranch_id1 	dcbranch_id2 		dcbranch_id3 	gen_id1 	gen_id2     gen_id3    dcconv_id1    dcconv_id2    dcconv_id3
mpc.contingencies = [

                    0.005       1 			0 				 0   			0   			0 					0   			0 			0 			0   		0 				0 			0;
                   	0.005       0 			0 				 0   			0 				0 					0   			1 			0 			0   		0 				0 			0;
               			0.005       0 			0 				 0   			0 				0 					0   			2 			0 			0   		0 				0 			0;
              			0.005       0 			0 				 0   			1 				0 					0   			0 			0 			0   		0 				0 			0;
                    0.005       0 			0 				 0   			2   			0 					0   			0 			0 			0   		0 				0 			0;
                   	0.005       0 			0 				 0   			3 				0 					0   			0 			0 			0   		0 				0 			0;
               			0.005       0 			0 				 0   			4 				0 					0   			0 			0 			0   		0 				0 			0;
              			0.005       0 			0 				 0   			0 				0 					0   			0 			0 			0   		1 				0 			0;
                    0.005       0 			0 				 0   			0 				0 					0   			0 			0 			0   		2 				0 			0;

                                     
 ];


%% dc grid topology
%colunm_names% dcpoles
mpc.dcpol=2;
% numbers of poles (1=monopolar grid, 2=bipolar grid)
%% bus data
%column_names%   busdc_i grid    Pdc     Vdc     basekVdc    Vdcmax  Vdcmin  Cdc
mpc.busdc = [
    1              1       0       1       345         1.1     0.9     0;
    2              1       100       1       345         1.1     0.9     0;
		3              1       50       1       345         1.1     0.9     0;
    4              1       -100       1       345         1.1     0.9     0;
];

%% converters
%column_names%   busdc_i busac_i type_dc type_ac P_g   Q_g   islcc Vtar    rtf xtf  transformer tm   bf filter    rc      xc  reactor   basekVac    Vmmax   Vmmin   Imax    status   LossA LossB  LossCrec LossCinv  droop      Pdcset    Vdcset  dVdcset Pacmax Pacmin Qacmax Qacmin
mpc.convdc = [
    1       1   2       1       0    0    0 1     0.01  0.01 1 1.02 0.01 1 0.01   0.01 1  345         1.1     0.9     1.1     1       1.103 0.887  2.885    2.885      0.0050    -58.6274   1.0079   0 100 -100 50 -50;
    3       2   3       1       0    0    0 1     0.01  0.01 1 1.02 0.01 1 0.01   0.01 1  345         1.1     0.9     1.1     1       1.103 0.887  2.885    2.885      0.0050    -58.6274   1.0079   0 100 -100 50 -50;
];

%% branches
%column_names%   fbusdc  tbusdc  r      l        c   rateA   rateB   rateC   status
mpc.branchdc = [
    1       2       0.052   0   0    100     100     100     1;
    2       3       0.052   0   0    100     100     100     1;
    3       4       0.073   0   0    100     100     100     1;
		1       4       0.073   0   0    100     100     100     1;
 ];

%% generator cost data
%	1	startup	shutdown	n	x1	y1	...	xn	yn
%	2	startup	shutdown	n	c(n-1)	...	c0
mpc.gencost = [
	2	0	0	3	0  1	0;
	2	0	0	3 0	 1	0;
];

% adds current ratings to branch matrix
%column_names%	c_rating_a
mpc.branch_currents = [
100;
];
