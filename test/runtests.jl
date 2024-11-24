# test/runtests.jl
using Test
using TechnicalAnalysis
using DataFrames
using Dates

@testset "TechnicalAnalysis.jl" begin
    # Test 1: Check if TA-Lib can be imported
    @testset "TA-Lib Import" begin
        @test isdefined(TechnicalAnalysis, :talib)
    end

    # Test 2: Run through all functions with sample data
    @testset "Function Execution" begin
        # Create sample data
        n = 60
        df = DataFrame(
            time = toUnix.(collect(now()-Day(n-1):Day(1):now())),
            open = rand(n) .* 100 .+ 50,
            high = rand(n) .* 100 .+ 75,
            low = rand(n) .* 100 .+ 25,
            close = rand(n) .* 100 .+ 50,
            volume = rand(n) .* 1000000
        )

        # Ensure high is highest, low is lowest
        for i in 1:n
            df.high[i] = max(df.high[i], df.open[i], df.close[i])
            df.low[i] = min(df.low[i], df.open[i], df.close[i])
        end

        # Test each function category
        for (category, functions) in function_list
            @testset "$category" begin
                for f in functions
                    @test begin
                        try
                            # Create a copy of the DataFrame for each test
                            test_df = copy(df)
                            f(test_df)
                            true
                        catch e
                            @warn "Function failed: $(f)" exception=e
                            false
                        end
                    end
                end
            end
        end
    end
end
