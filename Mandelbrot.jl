# Test convergence of a complex number z when iterated by 
#a polynomial f. I.e, does the sequence f(0), f(f(0)), f(f(f(0))), ... converge ?

using PyPlot

 function horner(coeffs,x)  # Polynomial evalluation using Horner's method, coeffs in increasing degree order
     sum = coeffs[end]
     for k = length(coeffs)-1:-1:1
       sum = coeffs[k] + x*sum
     end
     sum
 end



function mandel(c, coeffs)  # coeffs in increasing degree order, constant term has to be c! f(0) = c
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


function PlotMandelConvergence(Coeffs)

  
  ##################################################
  # create 500x500 Array for pixmap
  ##################################################
  NX = 10000
  NY = 10000
  M = Array(Int64, NX, NY)
    
  ##################################################
  ##################################################
  ##################################################
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
    
  ##################################################
  ##################################################
  ##################################################
  pygui(true)
  display(imshow(M'))
  PyPlot.show()
  M
end

PlotMandelConvergence([0.0+0.0im, 0.0+0.0im, 0.0+0.0im, 0.0+0.0im,0.0+0.0im,0.0+0.0im,1.0 + 0.0im])