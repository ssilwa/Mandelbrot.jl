# Mandelbrot.jl

This Julia program plots the Mandelbrot set for various seed polynomials. For example, the classical Mandelbrot Set is created using the following algorithm:

Consider the polynomial f(z) = z^2 + c. For various c in the complex plane, does the sequence f(0), f(f(0)), f(f(f(0))), ... converge? If so, color the complex number c. If the seqeuence diverges, color the point c according to how fast the sequence diverges. This creates the classical Mandelbrot Set as shown in the MandelbrotSet.png image.

We can now repeat this process by starting with different polynomials f(z). This creates fractal images similar to the Mandelbrot Set as shown. 

To run the code, just load Mandelbrot.jl into Julia using the command: (make sure you specify the path to the file if it is not in the same directory)

```julia
include("Mandelbrot.jl");
```
Then, pick a seed polynomial f(z). Write the polynomial coefficients in an array in increasing order. Make sure to write real numbers r and r + 0.0im. For example, we can let 

```julia
coeffs = [0.0 + 0.0im, 1.0 + .5*im, 3]
```

which corresponds to f(z) = 3z^2 + (1 + 5i)z + c. Note that we must have the constant term 0 in the coeffs array.
Then, we can run the following command to plot the corresponding Mandelbrot Set:

```julia
PlotMandelConvergence(coeffs)
```
