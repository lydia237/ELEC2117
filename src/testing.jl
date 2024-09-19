#=
macro make_square(var)
    return quote
        @eval function square($var)
            return $var * $var
        end
    end
end

@make_square x 
println(square(5))



macro define_sum_function(rows, cols)
    quote
        @eval function $(Symbol("sum_$(rows)x$(cols)"))(matrix::Matrix{Float64})
            if size(matrix) != ($(rows), $(cols))
                throw(ArgumentError($("Matrix must be $(rows)x$(cols)")))
            end
            return sum(matrix)
        end
    end
end

@define_sum_function 2 2
@define_sum_function 3 3

# test for 2x2 matrix
matrix_2x2 = [1.0 2.0; 3.0 4.0]
result_2x2 = sum_2x2(matrix_2x2)
println("Sum of 2x2 matrix: ", result_2x2)

#test for 3x3 matrix
matrix_3x3 = [1.0 2.0 3.0; 4.0 5.0 6.0; 7.0 8.0 9.0]
result_3x3 = sum_3x3(matrix_3x3)
println("Sum of 3x3 matrix: ", result_3x3)

try
    sum_2x2(matrix_3x3)
catch e 
    println("Caught expected error: ", e)
end



using Pkg
Pkg.add("Zygote")
using Zygote

function f(x)
    return x^3 + 2*x^2 + x
end

x=2.0
gradient = Zygote.gradient(f, x)[1]
println("Gradient of f at x = $x: $gradient")

=#