# Typical Price
function TP(high::Vector{T}, low::Vector{T}, close::Vector{T}) where {T<:AbstractFloat}
    (high .+ low .+ close) ./ 3
end

# Median Price
function MP(high::Vector{T}, low::Vector{T}) where {T<:AbstractFloat}
    (high .+ low) ./ 2
end

# Weighted Close Price
function WCP(high::Vector{T}, low::Vector{T}, close::Vector{T}) where {T<:AbstractFloat}
    (high .+ low .+ close .+ close) ./ 4
end

# Open-High-Low-Close Average
function OHLC(open::Vector{T}, high::Vector{T}, low::Vector{T}, close::Vector{T}) where {T<:AbstractFloat}
    (open .+ high .+ low .+ close) ./ 4
end

# Volume Weighted Average Price
function VWAP(high::Vector{T}, low::Vector{T}, close::Vector{T}, volume::Vector{T}) where {T<:AbstractFloat}
    sum(volume .* TP(high, low, close)) / sum(volume)
end

# Standard Deviation
function SD(close::Vector{T}, period::Int) where {T<:AbstractFloat}
    avg = sum(close[end-period+1:end]) / period
    sqrt(sum((close[end-period+1:end] .- avg) .^ 2) / (period - 1))
end

# Average True Range
function ATR(high::Vector{T}, low::Vector{T}, close::Vector{T}, period::Int) where {T<:AbstractFloat}
    tr = max.(high[2:end] - low[2:end], abs.(high[2:end] - close[1:end-1]), abs.(low[2:end] - close[1:end-1]))
    atr = zeros(T, length(high))
    atr[period:end] .= [sum(@view(tr[i-period+1:i])) / period for i in period:length(high)]
    atr
end
