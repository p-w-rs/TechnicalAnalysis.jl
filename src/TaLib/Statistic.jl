### Statistic Functions ###
# real = BETA(high, low, timeperiod=5)
function BETA(df; period=5)
    ind = talib.BETA(df[!, "high"], df[!, "low"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "beta-$period" => ind)
end

# real = CORREL(high, low, timeperiod=30)
function CORREL(df; period=30)
    ind = talib.CORREL(df[!, "high"], df[!, "low"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "correl-$period" => ind)
end

# real = LINEARREG(close, timeperiod=14)
function LINEARREG(df; period=14)
    ind = talib.LINEARREG(df[!, "close"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "linearreg-$period" => ind)
end

# real = LINEARREG_ANGLE(close, timeperiod=14)
function LINEARREG_ANGLE(df; period=14)
    ind = talib.LINEARREG_ANGLE(df[!, "close"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "linearreg_angle-$period" => ind)
end

# real = LINEARREG_INTERCEPT(close, timeperiod=14)
function LINEARREG_INTERCEPT(df; period=14)
    ind = talib.LINEARREG_INTERCEPT(df[!, "close"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "linearreg_intercept-$period" => ind)
end

# real = LINEARREG_SLOPE(close, timeperiod=14)
function LINEARREG_SLOPE(df; period=14)
    ind = talib.LINEARREG_SLOPE(df[!, "close"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "linearreg_slope-$period" => ind)
end

# real = STDDEV(close, timeperiod=5, nbdev=1)
function STDDEV(df; period=5, nbdev=1)
    ind = talib.STDDEV(df[!, "close"], timeperiod=period, nbdev=nbdev)
    insertcols!(df, length(propertynames(df)) + 1, "stddev-$period-$nbdev" => ind)
end

# real = TSF(close, timeperiod=14)
function TSF(df; period=14)
    ind = talib.TSF(df[!, "close"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "tsf-$period" => ind)
end

# real = VAR(close, timeperiod=5, nbdev=1)
function VAR(df; period=5, nbdev=1)
    ind = talib.VAR(df[!, "close"], timeperiod=period, nbdev=nbdev)
    insertcols!(df, length(propertynames(df)) + 1, "var-$period-$nbdev" => ind)
end