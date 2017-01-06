function [k,q] = knq_btw(N)

// Returns coupling factors k and first and last resonator's q of the
// Butterworth filter
//
//   N = filter order
//
// Usage:
//   [k,q] = kng_btw(N)

R=1/sin(%pi/(2*N));
C=zeros(1,N-1);

for b=1:N-1
	C(b)=sqrt((cos(%pi/N)-cos(2*%pi*b/N))/2);
end

k=0.5./C;
q=[2/R 2/R];
