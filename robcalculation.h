#ifndef ROBCALCULATION_H
#define ROBCALCULATION_H

#include <thread>
#include <future>

class robCalculation
{
public:
    std::thread Opti_Calc;
public:
    robCalculation(): Opti_Calc(){}
    ~robCalculation() {/*Opti_Calc.join();*/}
     double fact(double N);
       double calcSomeRob(int* iter,double freq, double t, double w, double b, double L, double a, double d, double p);
       double func(double x, double y, double w, double L, double m, double n, double a, double b);
       double doubleintegral(int *iter, double a, double b, double c, double d, double nx, double ny, double w, double L, double m, double n);
       double calcsomeYongshi(int* iter,double freq, double t, double w, double b, double L, double a, double d, double p, double xbol, double ybol, double n, double m, double sigma, double intval, bool RungeVal);
       double calcsomePoad(int* iter,double freq, double t, double w, double b, double L, double a, double d, double p, double xbol, double n, double m, double sigma, double intval, bool RungeVal);
       double calcsomePoadPlus(int* iter,double freq, double t, double w, double b, double L, double a, double d, double p, double xbol, double ybol, double n, double m, double sigma, double intval, bool RungeVal);
       double calcsomePoadMultiple(int* iter,double freq, double t, double w, double b, double  L, double a, double d, double p, double xbol, double ybol, double n, double m, double sigma, double intval, bool RungeVal);
       double calcsomeAKC(int* iter,double freq, double t, double w, double b, double L, double a, double d, double p, double xbol, double ybol, double sigma);
       double calcsomeAKCintegral(int* iter,double freq, double t, double w, double b, double L, double a, double d, double p, double xbol, double ybol, double n, double m, double sigma, double intval, bool RungeVal);
       double integral(double min, double max, double n, double m, double a, double L, int n_of_func);
       double func2(double x, double m, double a, double L);
       double func3(double y, double n, double b, double w);
       double ren(int* iter,double freq, double a, double b,double p, double d, double t, double w, double L, double nap, double map, double m,double n);
       double Dehkhoda_2007(int* iter,double freq, double a, double b,double p, double d, double w, double nap, double map, double m,double n, double dh, double dv);
       double Nie_2017(int* iter,double freq, double a, double b,double p, double d, double t, double w, double nap, double map, double m,double n, double dh, double dv);
       double calcMethod(double a, double d, double b, double p, double fm, double mnoj, double S11);
       double calcMethod2(double a, double d, double b, double p, double fm, double mnoj, double S11);

       double CalcTemp(int* iter,bool RungeVal, double xmax, double xmin, double temp6, double m, double a, double L, double intval);
};

#endif // ROBCALCULATION_H
