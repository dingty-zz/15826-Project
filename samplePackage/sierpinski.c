#include <math.h>
#include <stdio.h>
#include <assert.h>


double a[]= {0.5, 0.5, 0.5};
double b[]= {0.0, 0.0, 0.0};
double c[]= {0.0, 0.0, 0.0};
double d[]= {0.5, 0.5, 0.5};
double e[]= {0.0, 1.0, 0.5};
double f[]= {0.0, 0.0, 0.5};
double p[]= {0.33, 0.33, 0.34};

main(argc, argv)
int argc;
char *argv[];
{
    double x, y;
    double xnew, ynew;
    int i;
    double r;
    double drand48();
    void srand48();
    long seedval;
    int txid, gettxid();

    /*
    if( argc != 3){ 
	printf("usage: %s Voc_size sample_size\n", argv[0]);
	exit(-1);
    }
    */

    x=0.0; y=0.0;
    seedval = 1.0;
    srand48(seedval);
    for(i=0; i<5000; i++){
	r = drand48();
	/* pick transformation */
	txid = gettxid(r);
	xnew= a[txid]*x + b[txid]*y + e[txid];
	ynew= c[txid]*x + d[txid]*y + f[txid];
	x = xnew;
	y = ynew;
	/* printf("%g %g\"+\"\n", x, y);*/
	printf("%g %g\n", x, y);
    }
}

int gettxid(r)
double r;
{
    int i;
    double sum;

    assert(r<1.0);
    sum = p[0];
    i=0;
    while(r> sum){
	i++;
	sum += p[i];
    }
    return(i);
}
