function varargout=plClosedOrbit(varargin)
%PLCLOSEDORBIT Plots H and V 4x4 closed orbit
%
%Helper function for atplot: plot
%- H and V closed orbits on left axis
%- Dispersion on right axis
%
%  EXAMPLEs
%  1. PLOTDATA=plClosedOrbit(LINDATA,RING,DPP)
%  2. [S,PLOTDATA]=plClosedOrbit(RING,DPP)
%
%  See also atplot atbaseplot

if nargout == 1 % From atplot
    lindata=varargin{1};
    CoD=cat(2,lindata.ClosedOrbit)';
    [xref,zref]=atreforbit(varargin{2});
    xref(5)
    plotdata(1).values=CoD(:,[1 3])+[xref zref];
    plotdata(1).labels={'x_{co}','z_{co}'};
    plotdata(1).axislabel='x,z [m]';
    dispersion=cat(2,lindata.Dispersion)';
    plotdata(2).values=dispersion(:,3);
    plotdata(2).labels={'\eta_y'};
    plotdata(2).axislabel='Vertical dispersion [m]';
    varargout={plotdata};
else % From atbaseplot
    refpts=1:length(varargin{1})+1;
    [lindata,tune,chrom]=atlinopt(varargin{1:2},refpts); %#ok<ASGLU>
    varargout={cat(1,lindata.SPos),plClosedOrbit(lindata,varargin{:})};
end
end
