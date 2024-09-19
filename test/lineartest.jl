using Test
import Pkg
#Pkg.add("LinearODESolver")
#using LinearODESolver

@testset "LinearODESolver.jl" begin
    # Define a system matrix A
    A = [0.5 -0.2; 0.1 0.3]

    # Define initial conditions and time span
    u0 = [1.0, 0.0]
    tspan = (0.0, 50.0)

    # Define the ODE system
    prob = LinearODESolver.define_system(A, u0, tspan)

    # Solve the ODE problem
    sol = LinearODESolver.solve_system(prob)

    # Test if the solution is not empty
    @test !isempty(sol)

    # Test if the solution runs without errors
    @test Symbol(sol.retcode) == :Success

    # Plot the solution to check if the plot function runs
    LinearODESolver.plot_solution(sol)
end