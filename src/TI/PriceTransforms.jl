# Typical Price
function TP(high::Vector{Float64}, low::Vector{Float64}, close::Vector{Float64})
    (high .+ low .+ close) ./ 3
end

# Median Price
function MP(high::Vector{Float64}, low::Vector{Float64})
    (high .+ low) ./ 2
end

# Weighted Close Price
function WCP(high::Vector{Float64}, low::Vector{Float64}, close::Vector{Float64})
    (high .+ low .+ close .+ close) ./ 4
end

# Open-High-Low-Close Average
function OHLC(open::Vector{Float64}, high::Vector{Float64}, low::Vector{Float64}, close::Vector{Float64})
    (open .+ high .+ low .+ close) ./ 4
end

# Volume Weighted Average Price
function VWAP(high::Vector{Float64}, low::Vector{Float64}, close::Vector{Float64}, volume::Vector{Float64})
    sum(volume .* TP(high, low, close)) / sum(volume)
end

# Standard Deviation
function SD(close::Vector{Float64}, period::Int)
    avg = sum(close[end-period+1:end]) / period
    sqrt(sum((close[end-period+1:end] .- avg) .^ 2) / (period - 1))
end

# Average True Range
function ATR(high::Vector{Float64}, low::Vector{Float64}, close::Vector{Float64}, period::Int)
    tr = max.(high[2:end] - low[2:end], abs.(high[2:end] - close[1:end-1]), abs.(low[2:end] - close[1:end-1]))
    atr = zeros(Float64, length(high))
    atr[period:end] .= [sum(@view(tr[i-period+1:i])) / period for i in period:length(high)]
    atr
end
