# Mandelbrot.jl

This Julia program plots the Mandelbrot set for various seed polynomials. For example, the classical Mandelbrot Set is created using the following algorithm:

Consider the polynomial f(z) = z^2 + c. For various c in the complex plane, does the sequence f(0), f(f(0)), f(f(f(0))), ... converge? If so, color the complex number c. If the seqeuence diverges, color the point c according to how fast the sequence diverges. This creates the classical Mandelbrot Set as shown in the MandelbrotSet.png image.

We can now repeat this process by starting with different polynomials f(z). This creates fractal images similar to the Mandelbrot Set as shown. 
