# Relative Strength Index (RSI)
function RSI(data::Vector{T}, window::Int) where {T<:AbstractFloat}
    n = length(data)
    gains = zeros(n)
    losses = zeros(n)

    @inbounds for i in 2:n
        diff = data[i] - data[i-1]
        if diff >= 0
            gains[i] = diff
        else
            losses[i] = -diff
        end
    end

    avg_gain = sum(gains[1:window]) / window
    avg_loss = sum(losses[1:window]) / window

    out = similar(data)
    out[1:window] .= NaN

    @inbounds for i in window+1:n
        avg_gain = (avg_gain * (window - 1) + gains[i]) / window
        avg_loss = (avg_loss * (window - 1) + losses[i]) / window
        rs = avg_gain / avg_loss
        out[i] = 100 - (100 / (1 + rs))
    end
    out
end

# Stochastic Oscillator
function STOCH(high::Vector{T}, low::Vector{T}, close::Vector{T}, window::Int, smooth_window::Int=3) where {T<:AbstractFloat}
    n = length(close)
    out = similar(close)

    @inbounds for i in window:n
        high_price = maximum(high[i-window+1:i])
        low_price = minimum(low[i-window+1:i])
        out[i] = (close[i] - low_price) / (high_price - low_price) * 100
    end

    out[1:window-1] .= NaN
    out = SMA(out, smooth_window)
    out
end

# Moving Average Convergence Divergence (MACD)
function MACD(data::Vector{T}, fast_window::Int, slow_window::Int, signal_window::Int) where {T<:AbstractFloat}
    fast_ema = EMA(data, fast_window)
    slow_ema = EMA(data, slow_window)
    macd_line = fast_ema - slow_ema
    signal_line = EMA(macd_line, signal_window)
    histogram = macd_line - signal_line
    (macd_line, signal_line, histogram)
end

# Commodity Channel Index (CCI)
function CCI(high::Vector{T}, low::Vector{T}, close::Vector{T}, window::Int) where {T<:AbstractFloat}
    n = length(close)
    out = similar(close)
    tp = TP(high, low, close)
    sma_tp = SMA(tp, window)

    @inbounds for i in window:n
        mean_deviation = sum(abs.(tp[i-window+1:i] .- sma_tp[i])) / window
        out[i] = (tp[i] - sma_tp[i]) / (0.015 * mean_deviation)
    end

    out[1:window-1] .= NaN
    out
end

# Average Directional Index (ADX)
function ADX(high::Vector{T}, low::Vector{T}, close::Vector{T}, window::Int) where {T<:AbstractFloat}
    n = length(close)
    tr = zeros(n)
    dm_plus = zeros(n)
    dm_minus = zeros(n)

    @inbounds for i in 2:n
        tr[i] = max(high[i] - low[i], abs(high[i] - close[i-1]), abs(low[i] - close[i-1]))

        if high[i] - high[i-1] > low[i-1] - low[i]
            dm_plus[i] = max(high[i] - high[i-1], 0)
        end

        if low[i-1] - low[i] > high[i] - high[i-1]
            dm_minus[i] = max(low[i-1] - low[i], 0)
        end
    end

    tr_window = SMA(tr, window)
    di_plus = SMA(dm_plus, window) ./ tr_window .* 100
    di_minus = SMA(dm_minus, window) ./ tr_window .* 100
    dx = abs.(di_plus - di_minus) ./ (di_plus + di_minus) .* 100
    adx = SMA(dx, window)
    adx
end

# Bollinger Bands
function BBANDS(data::Vector{T}, window::Int, num_std::T=2.0) where {T<:AbstractFloat}
    sma = SMA(data, window)
    std_dev = zeros(length(data))

    @inbounds for i in window:length(data)
        std_dev[i] = std(data[i-window+1:i])
    end

    upper_band = sma .+ num_std .* std_dev
    lower_band = sma .- num_std .* std_dev
    (upper_band, sma, lower_band)
end

# Money Flow Index (MFI)
function MFI(high::Vector{T}, low::Vector{T}, close::Vector{T}, volume::Vector{T}, window::Int) where {T<:AbstractFloat}
    n = length(close)
    typical_price = (high .+ low .+ close) ./ 3
    money_flow = typical_price .* volume
    positive_money_flow = zeros(n)
    negative_money_flow = zeros(n)

    @inbounds for i in 2:n
        if typical_price[i] > typical_price[i-1]
            positive_money_flow[i] = money_flow[i]
        else
            negative_money_flow[i] = money_flow[i]
        end
    end

    money_flow_ratio = SMA(positive_money_flow, window) ./ SMA(negative_money_flow, window)
    out = 100 .- (100 ./ (1 .+ money_flow_ratio))
    out
end

# Chaikin Oscillator
function CHAIKIN(high::Vector{T}, low::Vector{T}, close::Vector{T}, volume::Vector{T}, fast_window::Int, slow_window::Int) where {T<:AbstractFloat}
    ad_line = (2 .* close .- (high .+ low)) ./ (high .- low) .* volume
    fast_ema = EMA(ad_line, fast_window)
    slow_ema = EMA(ad_line, slow_window)
    fast_ema - slow_ema
end

# Detrended Price Oscillator (DPO)
function DPO(data::Vector{T}, window::Int)
    n = length(data)
    sma = SMA(data, window)
    offset = div(window, 2) + 1
    out = similar(data)

    @inbounds for i in window:n
        out[i] = data[i] - sma[i-offset+1]
    end

    out[1:window-1] .= NaN
    out
end

# KDJ Oscillator
function KDJ(high::Vector{T}, low::Vector{T}, close::Vector{T}, window::Int, smooth_window::Int=3) where {T<:AbstractFloat}
    n = length(close)
    rsv = zeros(n)

    @inbounds for i in window:n
        high_price = maximum(high[i-window+1:i])
        low_price = minimum(low[i-window+1:i])
        rsv[i] = (close[i] - low_price) / (high_price - low_price) * 100
    end

    k = SMA(rsv, smooth_window)
    d = SMA(k, smooth_window)
    j = 3 .* k .- 2 .* d
    (k, d, j)
end

# Ichimoku Cloud
function ICHIMOKU(high::Vector{T}, low::Vector{T}, conversion_window::Int, base_window::Int, span_b_window::Int, lagging_window::Int) where {T<:AbstractFloat}
    n = length(high)
    conversion_line = zeros(n)
    base_line = zeros(n)
    span_a = zeros(n)
    span_b = zeros(n)
    lagging_span = zeros(n)

    @inbounds for i in 1:n
        if i >= conversion_window
            conversion_line[i] = (maximum(high[i-conversion_window+1:i]) + minimum(low[i-conversion_window+1:i])) / 2
        end

        if i >= base_window
            base_line[i] = (maximum(high[i-base_window+1:i]) + minimum(low[i-base_window+1:i])) / 2
        end

        if i >= span_b_window
            span_a[i] = (conversion_line[i] + base_line[i]) / 2
            span_b[i] = (maximum(high[i-span_b_window+1:i]) + minimum(low[i-span_b_window+1:i])) / 2
        end

        if i >= lagging_window
            lagging_span[i] = (conversion_line[i] + base_line[i]) / 2
        end
    end

    (conversion_line, base_line, span_a, span_b, lagging_span)
end

# Williams %R
function WILLR(high::Vector{T}, low::Vector{T}, close::Vector{T}, window::Int) where {T<:AbstractFloat}
    n = length(close)
    out = similar(close)

    @inbounds for i in window:n
        highest_high = maximum(high[i-window+1:i])
        lowest_low = minimum(low[i-window+1:i])
        out[i] = (highest_high - close[i]) / (highest_high - lowest_low) * -100
    end

    out[1:window-1] .= NaN
    out
end

# Ultimate Oscillator
function ULTOSC(high::Vector{T}, low::Vector{T}, close::Vector{T}, window1::Int, window2::Int, window3::Int) where {T<:AbstractFloat}
    n = length(close)
    buying_pressure = close .- low
    true_range = max.(high .- low, abs.(high .- lag(close)), abs.(low .- lag(close)))

    @inbounds for i in 2:n
        if true_range[i] == 0
            true_range[i] = true_range[i-1]
        end
    end

    avg_window1 = sum(buying_pressure[1:window1]) / sum(true_range[1:window1])
    avg_window2 = sum(buying_pressure[1:window2]) / sum(true_range[1:window2])
    avg_window3 = sum(buying_pressure[1:window3]) / sum(true_range[1:window3])

    out = similar(close)
    out[1:window3-1] .= NaN

    @inbounds for i in window3:n
        avg_window1 = (avg_window1 * (window1 - 1) + buying_pressure[i]) / (window1 * true_range[i])
        avg_window2 = (avg_window2 * (window2 - 1) + buying_pressure[i]) / (window2 * true_range[i])
        avg_window3 = (avg_window3 * (window3 - 1) + buying_pressure[i]) / (window3 * true_range[i])

        out[i] = 100 * (4 * avg_window1 + 2 * avg_window2 + avg_window3) / 7
    end
    out
end
