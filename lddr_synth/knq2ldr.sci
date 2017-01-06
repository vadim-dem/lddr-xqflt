function [lc,rg] = knq2ldr(k,q)

// Returns LC values and source/load R/G for filter defined by k and q
//
//   k = coupling factor vector
//	q = Q of first and last stages
//
// Usage:
//   [lc,rg] = knq2ldr(k,q)

order=length(k)+1;
lc=zeros(1,order);
rg=zeros(1,2);
rg(1)=1;
lc(1)=q(1);

for i=2:order
	lc(i)=1/((k(i-1)^2)*lc(i-1));
end

rg(2)=q(2)/lc(order);
