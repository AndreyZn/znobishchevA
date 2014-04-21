#include <stdio.h>

int N;

int main () {

        int i,j,cx=1;
        double h, t, x_new, sr=0, cnst=0, a, b, k ,cxt, U[16][10], x[16];

        scanf ("%d", &N);

        h=2.0/(N-1);
        //printf ("%f", h);
        t=0,5*h/cx;

        sr=(N-1)*0.5;
        cnst=(N-1)*0.25;

        //printf ("%f %f", sr, cnst);

        for (i=0; i<=N-1; i++) {
                x[i]=-1+h*i;
                if ((i>=(sr-cnst))&&(i<=(sr+cnst))) U[i][0]=1;
                else U[i][0]=0;

                printf ("%f ",x[i]);

        }

        printf("\n");

        for (j=1; j<=N; j++) {
                if (j!=N) {
                i=j;
                a=(U[i][0]-U[i-1][0])/h;
                b=U[i][0]-a*x[i];
                cxt=a*(x[i]-cx*t)+b;//cxt = U(x[i]-ct, 0)
                U[i][1]=cxt;
                }

                else {
                a=(U[0][0]-U[N-1][0])/h;
                b=U[0][0]-a*x[0];
                cxt=a*(x[0]-cx*t)+b;//cxt = U(x[i]-ct, 0)
                U[0][1]=cxt;
                }

                printf ("%f ", U[i][1]);
                }

return 0;
}