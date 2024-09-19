#=
using Pkg
Pkg.add("DifferentialEquations")
Pkg.add("Plots")

using Plots
using DifferentialEquations

function f!(du, u ,p, t)
    du[1] = -2u[1] + 1
end

u0 = [0.0]
tspan = (0.0, 5.0)
prob = ODEProblem(f!, u0, tspan)

sol = solve(prob)
plot(sol, xlabel="Time", ylabel="y", title="Solution of ODE")

=#
# exericise 1
using Plots
using DifferentialEquations
function f!(du, u, p, t)
    A = p
    du[1] = A[1,1]*u[1] + A[1,2]*u[2]
    du[2] = A[2,1]*u[1] + A[2,2]*u[2]
end

tspan = (0.0, 50.0)
A = [0.5 -0.2; 0.1 0.3]
u0 = [1.0, 0.0]

prob = ODEProblem(f!, u0, tspan, p)
sol = solve(prob)
plot(sol, xlabel="Time", ylabel="y", title="Solution of ODE")


