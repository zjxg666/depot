#include<bits/stdc++.h>
using namespace std;
double arctanx(double x)
{
	int i=1;
	double summ=0.0,y=x;
	while(abs(y/i)>=1e-6)
	{
		summ+=y/i;
		y=-1*x*x*y;
		i+=2;
	}
	return summ;
}
int main()
{
	double pai=6*(arctanx(1/sqrt(3)));
	printf("%.10lf",pai);
}

