module my_example_pkg

# Write your package code here.
using DifferentialEquations # this pkg is not used in this simple example 
using Plots 
export sum_values 
include("my_func.jl")

end
