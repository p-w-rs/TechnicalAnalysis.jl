### Overlap Studies Functions ###
# real = HMA(close, timeperiod=14)
function HMA(df; column="close", period=10)
    # Calculate the weighted moving average (WMA) for half the period
    half_period = Int(floor(period / 2))
    wma_half = talib.WMA(df[!, column], timeperiod=half_period)
    # Calculate the WMA for the full period
    wma_full = talib.WMA(df[!, column], timeperiod=period)
    # Calculate the HMA
    hma = 2 .* wma_half .- wma_full
    insertcols!(df, length(propertynames(df)) + 1, "hma-$column-$period" => hma)
end


# upperband, middleband, lowerband = BBANDS(close, timeperiod=5, nbdevup=2, nbdevdn=2, matype=0)
function BBANDS(df; column="close", period=5, nbdevup=2, nbdevdn=2)
    upperband, middleband, lowerband = talib.BBANDS(df[!, column], timeperiod=period, nbdevup=nbdevup, nbdevdn=nbdevdn)
    insertcols!(df, length(propertynames(df)) + 1, "bbands-upperband-$column-$period-$nbdevup-$nbdevdn" => upperband)
    insertcols!(df, length(propertynames(df)) + 1, "bbands-middleband-$column-$period-$nbdevup-$nbdevdn" => middleband)
    insertcols!(df, length(propertynames(df)) + 1, "bbands-lowerband-$column-$period-$nbdevup-$nbdevdn" => lowerband)
end

# real = DEMA(close, timeperiod=30)
function DEMA(df; column="close", period=30)
    ind = talib.DEMA(df[!, column], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "dema-$column-$period" => ind)
end

# real = EMA(close, timeperiod=30)
function EMA(df; column="close", period=30)
    ind = talib.EMA(df[!, column], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "ema-$column-$period" => ind)
end

# real = HT_TRENDLINE(close)
function HT_TRENDLINE(df; column="close")
    ind = talib.HT_TRENDLINE(df[!, column])
    insertcols!(df, length(propertynames(df)) + 1, "ht_trendline-$column" => ind)
end

# real = KAMA(close, timeperiod=30)
function KAMA(df; column="close", period=30)
    ind = talib.KAMA(df[!, column], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "kama-$column-$period" => ind)
end

# real = MA(close, timeperiod=30, matype=0)
function MA(df; column="close", period=30)
    ind = talib.MA(df[!, column], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "ma-$column-$period" => ind)
end


# mama, fama = MAMA(close, fastlimit=0.5, slowlimit=0.05)
function MAMA(df; column="close", fastlimit=0.5, slowlimit=0.05)
    mama, fama = talib.MAMA(df[!, column], fastlimit=fastlimit, slowlimit=slowlimit)
    insertcols!(df, length(propertynames(df)) + 1, "mama-$column-$fastlimit-$slowlimit" => mama)
    insertcols!(df, length(propertynames(df)) + 1, "mama-fama-$column-$fastlimit-$slowlimit" => fama)
end

# real = MAVP(close, periods, minperiod=2, maxperiod=30, matype=0)
function MAVP(df; column="close", periods=nothing, minperiod=2, maxperiod=30)
    ind = talib.MAVP(df[!, column], periods, minperiod=minperiod, maxperiod=maxperiod)
    insertcols!(df, length(propertynames(df)) + 1, "mavp-$column-$minperiod-$maxperiod" => ind)
end

# real = MIDPOINT(close, timeperiod=14)
function MIDPOINT(df; column="close", period=14)
    ind = talib.MIDPOINT(df[!, column], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "midpoint-$column-$period" => ind)
end

# real = MIDPRICE(high, low, timeperiod=14)
function MIDPRICE(df; period=14)
    midprice = talib.MIDPRICE(df[!, "high"], df[!, "low"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "midprice-$period" => midprice)
end

# real = SAR(high, low, acceleration=0, maximum=0)
function SAR(df; acceleration=0, maximum=0)
    sar = talib.SAR(df[!, "high"], df[!, "low"], acceleration=acceleration, maximum=maximum)
    insertcols!(df, length(propertynames(df)) + 1, "sar-$acceleration-$maximum" => sar)
end

# real = SMA(close, timeperiod=30)
function SMA(df; column="close", period=30)
    ind = talib.SMA(df[!, column], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "sma-$column-$period" => ind)
end

# real = T3(close, timeperiod=5, vfactor=0)
function T3(df; column="close", period=5, vfactor=0)
    ind = talib.T3(df[!, column], timeperiod=period, vfactor=vfactor)
    insertcols!(df, length(propertynames(df)) + 1, "t3-$column-$period-$vfactor" => ind)
end

# real = TEMA(close, timeperiod=30)
function TEMA(df; column="close", period=30)
    ind = talib.TEMA(df[!, column], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "tema-$column-$period" => ind)
end

# real = TRIMA(close, timeperiod=30)
function TRIMA(df; column="close", period=30)
    ind = talib.TRIMA(df[!, column], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "trima-$column-$period" => ind)
end

# real = WMA(close, timeperiod=30)
function WMA(df; column="close", period=30)
    ind = talib.WMA(df[!, column], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "wma-$column-$period" => ind)
end
