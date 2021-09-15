#include<bits/stdc++.h>
using namespace std;
int main()
{
	long long n,a,b;
	double x,y;
	scanf("%lld",&n);
	scanf("%lld%lld",&a,&b);
	x=b/(a/1.0);
	for(int i=2;i<=n;i++)
	{
		scanf("%lld%lld",&a,&b);
		y=b/(a/1.0);
		if(y-x>0.05) printf("better\n");
		else if(x-y>0.05) printf("worse\n");
		else printf("same\n");
	}
	return 0;
}
