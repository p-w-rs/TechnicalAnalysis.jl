# Simple Moving Average (SMA)
function SMA(data::Vector{T}, window::Int) where {T<:AbstractFloat}
    n = length(data)
    out = similar(data)
    out[1:window-1] .= NaN
    tmp_sum = sum(data[1:window])
    out[window] = tmp_sum / window
    @inbounds for i in window+1:n
        tmp_sum += data[i] - data[i-window]
        out[i] = tmp_sum / window
    end
    out
end

# Smoothed Moving Average (SMMA)
function SMMA(data::Vector{T}, window::Int) where {T<:AbstractFloat}
    out = similar(data)
    out[1:window-1] .= NaN
    out[window] = sum(data[1:window]) / window
    @inbounds for i in window+1:length(data)
        out[i] = (out[i-1] * (window - 1) + data[i]) / window
    end
    out
end

# Exponential Moving Average (EMA)
function EMA(data::Vector{T}, window::Int) where {T<:AbstractFloat}
    n = length(data)
    α = 2 / (window + 1)
    out = similar(data)
    out[1] = data[1]
    @inbounds for i in 2:n
        out[i] = α * data[i] + (1 - α) * out[i-1]
    end
    out
end

# Weighted Moving Average (WMA)
function WMA(data::Vector{T}, window::Int) where {T<:AbstractFloat}
    n = length(data)
    weights = collect(1:window)
    denom = sum(weights)
    out = similar(data)
    out[1:window-1] .= NaN
    @inbounds for i in window:n
        out[i] = sum(data[i-window+1:i] .* weights) / denom
    end
    out
end

# Hull Moving Average (HMA)
function HMA(data::Vector{T}, window::Int) where {T<:AbstractFloat}
    sqrt_window = round(Int, sqrt(window))
    wma1 = WMA(data, window)
    wma2 = WMA(wma1, sqrt_window)
    wma2 .* 2 .- wma1
end

# Kaufman's Adaptive Moving Average (KAMA)
function KAMA(data::Vector{T}, window::Int; fastend::T=2.0, slowend::T=30.0) where {T<:AbstractFloat}
    n = length(data)
    out = similar(data)
    out[1] = data[1]
    volatility_sum = 0.0
    @inbounds for i in 2:window
        volatility_sum += abs(data[i] - data[i-1])
    end
    @inbounds for i in window+1:n
        volatility_ratio = volatility_sum / (window - 1)
        efficiency_ratio = (data[i] - data[i-window]) / volatility_sum
        smoothing_constant = (efficiency_ratio * (fastend - slowend) + slowend)^2
        out[i] = out[i-1] + smoothing_constant * (data[i] - out[i-1])
        volatility_sum += abs(data[i] - data[i-1]) - abs(data[i-window] - data[i-window-1])
    end
    out
end

# Arnaud Legoux Moving Average (ALMA)
function ALMA(data::Vector{T}, window::Int, offset::T=0.85, sigma::T=6.0) where {T<:AbstractFloat}
    n = length(data)
    m = floor(offset * (window - 1))
    s = window / sigma
    norm = 0.0
    sum_weights = 0.0

    @inbounds for i in 0:window-1
        weight = exp(-(i - m)^2 / (2 * s^2))
        norm += weight
        sum_weights += weight * data[n-i]
    end

    out = similar(data)
    out[1:n-window] .= NaN
    out[n-window+1:n] .= sum_weights / norm
    out
end

# Linear Weighted Moving Average (LWMA)
function LWMA(data::Vector{T}, window::Int) where {T<:AbstractFloat}
    WMA(data, window)
end

# Volume Weighted Average Price (VWAP)
function VWAP(price::Vector{T}, volume::Vector{T}, window::Int) where {T<:AbstractFloat}
    n = length(price)
    out = similar(price)
    out[1:window-1] .= NaN
    @inbounds for i in window:n
        price_volume_sum = sum(price[i-window+1:i] .* volume[i-window+1:i])
        volume_sum = sum(volume[i-window+1:i])
        out[i] = price_volume_sum / volume_sum
    end
    out
end

# Triangular Moving Average (TRIMA)
function TRIMA(data::Vector{T}, window::Int) where {T<:AbstractFloat}
    n = length(data)
    out = similar(data)
    sma_window = div(window, 2) + 1
    sma_data = SMA(data, sma_window)
    out[1:n-sma_window] = SMA(sma_data, sma_window)
    out
end
