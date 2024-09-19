#=
#exercise2
using Zygote

# Define the macro
macro diff_macro(expr)
    quote
        # Function to compute the value of the expression
        @eval function value_func(x) 
            f(x) = $(expr)
            return f(x)
        end
        # Function to compute the derivative of the expression
        @eval function deriv_func(x)
            f(x) = $(expr)
            return Zygote.gradient(f, x)[1]
        end
    end
end

# Test the macro
@diff_macro(x^2 + 3x + 5)

# Compute the value and derivative at x = 2
val = value_func(2)
deriv = deriv_func(2)

println("Value at x = 2: $val")       # Expected output: 15
println("Derivative at x = 2: $deriv")  # Expected output: 7


#exercise1
using ForwardDiff

macro gradient_expr(expr)
    quote
        @eval function gradient_function(v::Vector)
            f(v::Vector) = $(expr)  
            return ForwardDiff.gradient(f, v)
        end
    end
end


@gradient_expr v[1]^2 + v[2]^2
v = [1.0, 2.0]

result = gradient_function(v)

println(result)  #[2.0, 4.0]

=#