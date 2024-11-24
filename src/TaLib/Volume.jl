### Volume Indicator Functions ###
# real = AD(high, low, close, volume)
function AD(df)
    ind = talib.AD(df[!, "high"], df[!, "low"], df[!, "close"], df[!, "volume"])
    insertcols!(df, length(propertynames(df)) + 1, "ad" => ind)
end

# real = ADOSC(high, low, close, volume, fastperiod=3, slowperiod=10)
function ADOSC(df; fastperiod=3, slowperiod=10)
    ind = talib.ADOSC(df[!, "high"], df[!, "low"], df[!, "close"], df[!, "volume"], fastperiod=fastperiod, slowperiod=slowperiod)
    insertcols!(df, length(propertynames(df)) + 1, "adosc-$fastperiod-$slowperiod" => ind)
end

# real = OBV(close, volume)
function OBV(df)
    ind = talib.OBV(df[!, "close"], df[!, "volume"])
    insertcols!(df, length(propertynames(df)) + 1, "obv" => ind)
end