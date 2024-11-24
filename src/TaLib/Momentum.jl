### Momentum Indicator Functions ###
# real = ADX(high, low, close, timeperiod=14)
function ADX(df; period=14)
    ind = talib.ADX(df[!, "high"], df[!, "low"], df[!, "close"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "adx-$period" => ind)
end

# real = ADXR(high, low, close, timeperiod=14)
function ADXR(df; period=14)
    ind = talib.ADXR(df[!, "high"], df[!, "low"], df[!, "close"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "adxr-$period" => ind)
end

# real = APO(close, fastperiod=12, slowperiod=26, matype=0)
function APO(df; column="close", fastperiod=12, slowperiod=26)
    ind = talib.APO(df[!, column], fastperiod=fastperiod, slowperiod=slowperiod)
    insertcols!(df, length(propertynames(df)) + 1, "apo-$fastperiod-$slowperiod" => ind)
end

# aroondown, aroonup = AROON(high, low, timeperiod=14)
function AROON(df; period=14)
    aroondown, aroonup = talib.AROON(df[!, "high"], df[!, "low"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "aroon-aroondown-$period" => aroondown)
    insertcols!(df, length(propertynames(df)) + 1, "aroon-aroonup-$period" => aroonup)
end

# real = AROONOSC(high, low, timeperiod=14)
function AROONOSC(df; period=14)
    ind = talib.AROONOSC(df[!, "high"], df[!, "low"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "aroonosc-$period" => ind)
end

# real = BOP(open, high, low, close)
function BOP(df)
    ind = talib.BOP(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "bop" => ind)
end

# real = CCI(high, low, close, timeperiod=14)
function CCI(df; period=14)
    ind = talib.CCI(df[!, "high"], df[!, "low"], df[!, "close"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "cci-$period" => ind)
end

# real = CMO(close, timeperiod=14)
function CMO(df; column="close", period=14)
    ind = talib.CMO(df[!, column], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "cmo-$column-$period" => ind)
end

# real = DX(high, low, close, timeperiod=14)
function DX(df; period=14)
    ind = talib.DX(df[!, "high"], df[!, "low"], df[!, "close"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "dx-$period" => ind)
end

# macd, macdsignal, macdhist = MACD(close, fastperiod=12, slowperiod=26, signalperiod=9)
function MACD(df; column="close", fastperiod=12, slowperiod=26, signalperiod=9)
    macd, macdsignal, macdhist = talib.MACD(df[!, column], fastperiod=fastperiod, slowperiod=slowperiod, signalperiod=signalperiod)
    insertcols!(df, length(propertynames(df)) + 1, "macd-$fastperiod-$slowperiod-$signalperiod" => macd)
    insertcols!(df, length(propertynames(df)) + 1, "macd-macdsignal-$fastperiod-$slowperiod-$signalperiod" => macdsignal)
    insertcols!(df, length(propertynames(df)) + 1, "macd-macdhist-$fastperiod-$slowperiod-$signalperiod" => macdhist)
end

# macd, macdsignal, macdhist = MACDEXT(close, fastperiod=12, fastmatype=0, slowperiod=26, slowmatype=0, signalperiod=9, signalmatype=0)
function MACDEXT(df; column="close", fastperiod=12, slowperiod=26, signalperiod=9)
    macd, macdsignal, macdhist = talib.MACDEXT(df[!, column], fastperiod=fastperiod, slowperiod=slowperiod, signalperiod=signalperiod)
    insertcols!(df, length(propertynames(df)) + 1, "macdext-$column-$fastperiod-$slowperiod-$signalperiod" => macd)
    insertcols!(df, length(propertynames(df)) + 1, "macdext-signal-$column-$fastperiod-$slowperiod-$signalperiod" => macdsignal)
    insertcols!(df, length(propertynames(df)) + 1, "macdext-hist-$column-$fastperiod-$slowperiod-$signalperiod" => macdhist)
end

# macd, macdsignal, macdhist = MACDFIX(close, signalperiod=9)
function MACDFIX(df; column="close", signalperiod=9)
    macd, macdsignal, macdhist = talib.MACDFIX(df[!, column], signalperiod=signalperiod)
    insertcols!(df, length(propertynames(df)) + 1, "macdfix-$column-$signalperiod" => macd)
    insertcols!(df, length(propertynames(df)) + 1, "macdfix-signal-$column-$signalperiod" => macdsignal)
    insertcols!(df, length(propertynames(df)) + 1, "macdfix-hist-$column-$signalperiod" => macdhist)
end

# real = MFI(high, low, close, volume, timeperiod=14)
function MFI(df; period=14)
    ind = talib.MFI(df[!, "high"], df[!, "low"], df[!, "close"], df[!, "volume"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "mfi-$period" => ind)
end

# real = MINUS_DI(high, low, close, timeperiod=14)
function MINUS_DI(df; period=14)
    ind = talib.MINUS_DI(df[!, "high"], df[!, "low"], df[!, "close"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "minus_di-$period" => ind)
end

# real = MINUS_DM(high, low, timeperiod=14)
function MINUS_DM(df; period=14)
    ind = talib.MINUS_DM(df[!, "high"], df[!, "low"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "minus_dm-$period" => ind)
end

# real = MOM(close, timeperiod=10)
function MOM(df; column="close", period=10)
    ind = talib.MOM(df[!, column], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "mom-$column-$period" => ind)
end

# real = PLUS_DI(high, low, close, timeperiod=14)
function PLUS_DI(df; period=14)
    ind = talib.PLUS_DI(df[!, "high"], df[!, "low"], df[!, "close"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "plus_di-$period" => ind)
end

# real = PLUS_DM(high, low, timeperiod=14)
function PLUS_DM(df; period=14)
    ind = talib.PLUS_DM(df[!, "high"], df[!, "low"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "plus_dm-$period" => ind)
end

# real = PPO(close, fastperiod=12, slowperiod=26, matype=0)
function PPO(df; column="close", fastperiod=12, slowperiod=26)
    ind = talib.PPO(df[!, column], fastperiod=fastperiod, slowperiod=slowperiod)
    insertcols!(df, length(propertynames(df)) + 1, "ppo-$fastperiod-$slowperiod" => ind)
end

# real = ROC(close, timeperiod=10)
function ROC(df; column="close", period=10)
    ind = talib.ROC(df[!, column], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "roc-$column-$period" => ind)
end

# real = ROCP(close, timeperiod=10)
function ROCP(df; column="close", period=10)
    ind = talib.ROCP(df[!, column], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "rocp-$column-$period" => ind)
end

# real = ROCR(close, timeperiod=10)
function ROCR(df; column="close", period=10)
    ind = talib.ROCR(df[!, column], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "rocr-$column-$period" => ind)
end


# real = ROCR100(close, timeperiod=10)
function ROCR100(df; column="close", period=10)
    ind = talib.ROCR100(df[!, column], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "rocr100-$column-$period" => ind)
end

# real = RSI(close, timeperiod=14)
function RSI(df; column="close", period=14)
    ind = talib.RSI(df[!, column], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "rsi-$column-$period" => ind)
end

# slowk, slowd = STOCH(high, low, close, fastk_period=5, slowk_period=3, slowk_matype=0, slowd_period=3, slowd_matype=0)
function STOCH(df; fastk_period=5, slowk_period=3, slowd_period=3)
    slowk, slowd = talib.STOCH(df[!, "high"], df[!, "low"], df[!, "close"], fastk_period=fastk_period, slowk_period=slowk_period, slowd_period=slowd_period)
    insertcols!(df, length(propertynames(df)) + 1, "stoch-slowk-$fastk_period-$slowk_period-$slowd_period" => slowk)
    insertcols!(df, length(propertynames(df)) + 1, "stoch-slowd-$fastk_period-$slowk_period-$slowd_period" => slowd)
end

# fastk, fastd = STOCHF(high, low, close, fastk_period=5, fastd_period=3, fastd_matype=0)
function STOCHF(df; fastk_period=5, fastd_period=3)
    fastk, fastd = talib.STOCHF(df[!, "high"], df[!, "low"], df[!, "close"], fastk_period=fastk_period, fastd_period=fastd_period)
    insertcols!(df, length(propertynames(df)) + 1, "stochf-fastk-$fastk_period-$fastd_period" => fastk)
    insertcols!(df, length(propertynames(df)) + 1, "stochf-fastd-$fastk_period-$fastd_period" => fastd)
end

# fastk, fastd = STOCHRSI(close, timeperiod=14, fastk_period=5, fastd_period=3, fastd_matype=0)
function STOCHRSI(df; column="close", timeperiod=14, fastk_period=5, fastd_period=3)
    fastk, fastd = talib.STOCHRSI(df[!, column], timeperiod=timeperiod, fastk_period=fastk_period, fastd_period=fastd_period)
    insertcols!(df, length(propertynames(df)) + 1, "stochrsi-fastk-rsi-$timeperiod-$fastk_period-$fastd_period" => fastk)
    insertcols!(df, length(propertynames(df)) + 1, "stochrsi-fastd-rsi-$timeperiod-$fastk_period-$fastd_period" => fastd)
end

# real = TRIX(close, timeperiod=30)
function TRIX(df; column="close", period=30)
    ind = talib.TRIX(df[!, column], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "trix-$column-$period" => ind)
end

# real = ULTOSC(high, low, close, timeperiod1=7, timeperiod2=14, timeperiod3=28)
function ULTOSC(df; period1=7, period2=14, period3=28)
    ind = talib.ULTOSC(df[!, "high"], df[!, "low"], df[!, "close"], timeperiod1=period1, timeperiod2=period2, timeperiod3=period3)
    insertcols!(df, length(propertynames(df)) + 1, "ultosc-$period1-$period2-$period3" => ind)
end

# real = WILLR(high, low, close, timeperiod=14)
function WILLR(df; period=14)
    ind = talib.WILLR(df[!, "high"], df[!, "low"], df[!, "close"], timeperiod=period)
    insertcols!(df, length(propertynames(df)) + 1, "willr-$period" => ind)
end
