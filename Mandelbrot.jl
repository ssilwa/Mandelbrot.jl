# Plots the Mandelbrot set corresponding to the seed polynomial f(z) + c
# Colors correspond to how fast the sequence f(0), f(f(0)), ... diverges
# The classical Mandelbrot Set is f(z) = z^2 + c




using PyPlot # Only need to do this once

 # Polynomial evaluation using Horner's method, Coeffs in increasing degree order
 function horner(coeffs,x) 
     sum = coeffs[end]
     for k = length(coeffs)-1:-1:1
       sum = coeffs[k] + x*sum
     end
     sum
 end


# The constant term has to be equal to 0 initially
# We then set the constant term equal to c for various complex numbers c

function mandel(c, coeffs)  
    coeffs[1] = c  # set constant term
    maxiter = 80
    for n = 1:maxiter
        if abs(c) > 2
            return n-1
        end
        c = horner(coeffs, c)

    end
    return maxiter
end

# Ploting 
function PlotMandelConvergence(Coeffs)

  NX = 10000
  NY = 10000
  M = Array(Int64, NX, NY)
    

  XMax = 1.5;
  YMax = 1.5;
  DeltaX = 2.0*XMax/(NX-1);
  DeltaY = 2.0*YMax/(NY-1);
  Y=-YMax;
  StartTime=time()
  for ny=1:NY
     X=-XMax;
     for nx=1:NX
       M[nx,ny] = mandel(X+Y*im,Coeffs)
       X+=DeltaX
     end
     Y+=DeltaY
  end
  StopTime=time() - StartTime;
  println("Done in ",StopTime," s.\n");

  pygui(true)
  display(imshow(M'))
  PyPlot.show()
  M
end

#PlotMandelConvergence(ceoffs) <- Use this command to run program
#For example: coeffs = [0.0 + 0.0im, 0.0 + 0.0im, 1.0 + 0.0im]
#Note that the constant term always has to be 0!
