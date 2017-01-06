function [k,q] = knq_ch1(N,Rp)

// Returns coupling factors k and first and last resonator's q of the
// Chebyshev filter
//
//   N = filter order
//   Rp = passband ripple
//
// Usage:
//   [k,q] = ldr_ch1(N,Rp)

s=10^(Rp/20);
t=(1/N)*atanh(1/s);
R=sinh(t)/sin(%pi/(2*N));
C=zeros(1,N-1);

for b=1:N-1
	C(b)=sqrt((cos(%pi/N)-cos(2*%pi*b/N))/(cosh(2*t)-cos(2*%pi*b/N)));
end

k=0.5./C;
q=[2/R 2/R];
