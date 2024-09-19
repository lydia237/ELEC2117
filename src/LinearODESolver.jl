module LinearODESolver

using DifferentialEquations, Plots

export define_system, solve_system, plot_solution

# Function to define the system of ODEs
function define_system(A::Matrix, u0::Vector, tspan::Tuple)
    function system!(du, u, p, t)
        du[1] = A[1,1] * u[1] + A[1,2] * u[2]
        du[2] = A[2,1] * u[1] + A[2,2] * u[2]
    end
    ODEProblem(system!, u0, tspan, A)
end

# Function to solve the ODE system
function solve_system(prob::ODEProblem)
    solve(prob)
end

# Function to plot the solution
function plot_solution(sol::ODESolution)
    plot(sol, title="Solution for x1(t) and x2(t)", labels=["x1(t)" "x2(t)"], xlabel="Time", ylabel="Values")
end

end