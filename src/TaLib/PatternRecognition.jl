### Pattern Recognition Functions ###
# integer = CDL2CROWS(open, high, low, close)
function CDL2CROWS(df)
    ind = talib.CDL2CROWS(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdl2crows" => ind)
end

# integer = CDL3BLACKCROWS(open, high, low, close)
function CDL3BLACKCROWS(df)
    ind = talib.CDL3BLACKCROWS(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdl3blackcrows" => ind)
end

# integer = CDL3INSIDE(open, high, low, close)
function CDL3INSIDE(df)
    ind = talib.CDL3INSIDE(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdl3inside" => ind)
end

# integer = CDL3LINESTRIKE(open, high, low, close)
function CDL3LINESTRIKE(df)
    ind = talib.CDL3LINESTRIKE(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdl3linestrike" => ind)
end

# integer = CDL3OUTSIDE(open, high, low, close)
function CDL3OUTSIDE(df)
    ind = talib.CDL3OUTSIDE(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdl3outside" => ind)
end

# integer = CDL3STARSINSOUTH(open, high, low, close)
function CDL3STARSINSOUTH(df)
    ind = talib.CDL3STARSINSOUTH(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdl3starsinsouth" => ind)
end

# integer = CDL3WHITESOLDIERS(open, high, low, close)
function CDL3WHITESOLDIERS(df)
    ind = talib.CDL3WHITESOLDIERS(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdl3whitesoldiers" => ind)
end

# integer = CDLABANDONEDBABY(open, high, low, close, penetration=0)
function CDLABANDONEDBABY(df; penetration=0)
    ind = talib.CDLABANDONEDBABY(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"], penetration=penetration)
    insertcols!(df, length(propertynames(df)) + 1, "cdlabandonedbaby-$penetration" => ind)
end

# integer = CDLADVANCEBLOCK(open, high, low, close)
function CDLADVANCEBLOCK(df)
    ind = talib.CDLADVANCEBLOCK(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdladvanceblock" => ind)
end

# integer = CDLBELTHOLD(open, high, low, close)
function CDLBELTHOLD(df)
    ind = talib.CDLBELTHOLD(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlbelthold" => ind)
end

# integer = CDLBREAKAWAY(open, high, low, close)
function CDLBREAKAWAY(df)
    ind = talib.CDLBREAKAWAY(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlbreakaway" => ind)
end

# integer = CDLCLOSINGMARUBOZU(open, high, low, close)
function CDLCLOSINGMARUBOZU(df)
    ind = talib.CDLCLOSINGMARUBOZU(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlclosingmarubozu" => ind)
end

# integer = CDLCONCEALBABYSWALL(open, high, low, close)
function CDLCONCEALBABYSWALL(df)
    ind = talib.CDLCONCEALBABYSWALL(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlconcealbabyswall" => ind)
end

# integer = CDLCOUNTERATTACK(open, high, low, close)
function CDLCOUNTERATTACK(df)
    ind = talib.CDLCOUNTERATTACK(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlcounterattack" => ind)
end

# integer = CDLDARKCLOUDCOVER(open, high, low, close, penetration=0)
function CDLDARKCLOUDCOVER(df; penetration=0)
    ind = talib.CDLDARKCLOUDCOVER(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"], penetration=penetration)
    insertcols!(df, length(propertynames(df)) + 1, "cdldarkcloudcover" => ind)
end

# integer = CDLDOJI(open, high, low, close)
function CDLDOJI(df)
    ind = talib.CDLDOJI(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdldoji" => ind)
end

# integer = CDLDOJISTAR(open, high, low, close)
function CDLDOJISTAR(df)
    ind = talib.CDLDOJISTAR(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdldojistar" => ind)
end

# integer = CDLDRAGONFLYDOJI(open, high, low, close)
function CDLDRAGONFLYDOJI(df)
    ind = talib.CDLDRAGONFLYDOJI(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdldragonflydoji" => ind)
end

# integer = CDLENGULFING(open, high, low, close)
function CDLENGULFING(df)
    ind = talib.CDLENGULFING(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlengulfing" => ind)
end

# integer = CDLEVENINGDOJISTAR(open, high, low, close, penetration=0)
function CDLEVENINGDOJISTAR(df; penetration=0)
    ind = talib.CDLEVENINGDOJISTAR(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"], penetration=penetration)
    insertcols!(df, length(propertynames(df)) + 1, "cdleveningdojistar-$penetration" => ind)
end

# integer = CDLEVENINGSTAR(open, high, low, close, penetration=0)
function CDLEVENINGSTAR(df; penetration=0)
    ind = talib.CDLEVENINGSTAR(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"], penetration=penetration)
    insertcols!(df, length(propertynames(df)) + 1, "cdleveningstar-$penetration" => ind)
end

# integer = CDLGAPSIDESIDEWHITE(open, high, low, close)
function CDLGAPSIDESIDEWHITE(df)
    ind = talib.CDLGAPSIDESIDEWHITE(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlgapsidefwhite" => ind)
end

# integer = CDLGRAVESTONEDOJI(open, high, low, close)
function CDLGRAVESTONEDOJI(df)
    ind = talib.CDLGRAVESTONEDOJI(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlgravestonedoji" => ind)
end

# integer = CDLHAMMER(open, high, low, close)
function CDLHAMMER(df)
    ind = talib.CDLHAMMER(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlhammer" => ind)
end

# integer = CDLHANGINGMAN(open, high, low, close)
function CDLHANGINGMAN(df)
    ind = talib.CDLHANGINGMAN(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlhangingman" => ind)
end

# integer = CDLHARAMI(open, high, low, close)
function CDLHARAMI(df)
    ind = talib.CDLHARAMI(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlharami" => ind)
end

# integer = CDLHARAMICROSS(open, high, low, close)
function CDLHARAMICROSS(df)
    ind = talib.CDLHARAMICROSS(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlharamicross" => ind)
end

# integer = CDLHIGHWAVE(open, high, low, close)
function CDLHIGHWAVE(df)
    ind = talib.CDLHIGHWAVE(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlhighwave" => ind)
end

# integer = CDLHIKKAKE(open, high, low, close)
function CDLHIKKAKE(df)
    ind = talib.CDLHIKKAKE(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlhikkake" => ind)
end

# integer = CDLHIKKAKEMOD(open, high, low, close)
function CDLHIKKAKEMOD(df)
    ind = talib.CDLHIKKAKEMOD(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlhikkakemod" => ind)
end

# integer = CDLHOMINGPIGEON(open, high, low, close)
function CDLHOMINGPIGEON(df)
    ind = talib.CDLHOMINGPIGEON(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlhomingpigeon" => ind)
end

# integer = CDLIDENTICAL3CROWS(open, high, low, close)
function CDLIDENTICAL3CROWS(df)
    ind = talib.CDLIDENTICAL3CROWS(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlidentical3crows" => ind)
end

# integer = CDLINNECK(open, high, low, close)
function CDLINNECK(df)
    ind = talib.CDLINNECK(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlinneck" => ind)
end

# integer = CDLINVERTEDHAMMER(open, high, low, close)
function CDLINVERTEDHAMMER(df)
    ind = talib.CDLINVERTEDHAMMER(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlinvertedhammer" => ind)
end

# integer = CDLKICKING(open, high, low, close)
function CDLKICKING(df)
    ind = talib.CDLKICKING(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlkicking" => ind)
end

# integer = CDLKICKINGBYLENGTH(open, high, low, close)
function CDLKICKINGBYLENGTH(df)
    ind = talib.CDLKICKINGBYLENGTH(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlkickingbylength" => ind)
end

# integer = CDLLADDERBOTTOM(open, high, low, close)
function CDLLADDERBOTTOM(df)
    ind = talib.CDLLADDERBOTTOM(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlladderbottom" => ind)
end

# integer = CDLLONGLEGGEDDOJI(open, high, low, close)
function CDLLONGLEGGEDDOJI(df)
    ind = talib.CDLLONGLEGGEDDOJI(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdllongleggeddoji" => ind)
end

# integer = CDLLONGLINE(open, high, low, close)
function CDLLONGLINE(df)
    ind = talib.CDLLONGLINE(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdllongline" => ind)
end

# integer = CDLMARUBOZU(open, high, low, close)
function CDLMARUBOZU(df)
    ind = talib.CDLMARUBOZU(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlmarubozu" => ind)
end

# integer = CDLMATCHINGLOW(open, high, low, close)
function CDLMATCHINGLOW(df)
    ind = talib.CDLMATCHINGLOW(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlmatchinglow" => ind)
end

# integer = CDLMATHOLD(open, high, low, close, penetration=0)
function CDLMATHOLD(df; penetration=0)
    ind = talib.CDLMATHOLD(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"], penetration=penetration)
    insertcols!(df, length(propertynames(df)) + 1, "cdlmathold-$penetration" => ind)
end

# integer = CDLMORNINGDOJISTAR(open, high, low, close, penetration=0)
function CDLMORNINGDOJISTAR(df; penetration=0)
    ind = talib.CDLMORNINGDOJISTAR(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"], penetration=penetration)
    insertcols!(df, length(propertynames(df)) + 1, "cdlmorningdojistar-$penetration" => ind)
end

# integer = CDLMORNINGSTAR(open, high, low, close, penetration=0)
function CDLMORNINGSTAR(df; penetration=0)
    ind = talib.CDLMORNINGSTAR(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"], penetration=penetration)
    insertcols!(df, length(propertynames(df)) + 1, "cdlmorningstar-$penetration" => ind)
end

# integer = CDLONNECK(open, high, low, close)
function CDLONNECK(df)
    ind = talib.CDLONNECK(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlonneck" => ind)
end

# integer = CDLPIERCING(open, high, low, close)
function CDLPIERCING(df)
    ind = talib.CDLPIERCING(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlpiercing" => ind)
end

# integer = CDLRICKSHAWMAN(open, high, low, close)
function CDLRICKSHAWMAN(df)
    ind = talib.CDLRICKSHAWMAN(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlrickshawman" => ind)
end

# integer = CDLRISEFALL3METHODS(open, high, low, close)
function CDLRISEFALL3METHODS(df)
    ind = talib.CDLRISEFALL3METHODS(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlrisefall3methods" => ind)
end

# integer = CDLSEPARATINGLINES(open, high, low, close)
function CDLSEPARATINGLINES(df)
    ind = talib.CDLSEPARATINGLINES(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlseparatinglines" => ind)
end

# integer = CDLSHOOTINGSTAR(open, high, low, close)
function CDLSHOOTINGSTAR(df)
    ind = talib.CDLSHOOTINGSTAR(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlshootingstar" => ind)
end

# integer = CDLSHORTLINE(open, high, low, close)
function CDLSHORTLINE(df)
    ind = talib.CDLSHORTLINE(df[!, "open"], df[!, "high"], df[!, "low"], df[!,"close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlshortline" => ind)
end

# integer = CDLSPINNINGTOP(open, high, low, close)
function CDLSPINNINGTOP(df)
    ind = talib.CDLSPINNINGTOP(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlspinningtop" => ind)
end

# integer = CDLSTALLEDPATTERN(open, high, low, close)
function CDLSTALLEDPATTERN(df)
    ind = talib.CDLSTALLEDPATTERN(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlstalledpattern" => ind)
end

# integer = CDLSTICKSANDWICH(open, high, low, close)
function CDLSTICKSANDWICH(df)
    ind = talib.CDLSTICKSANDWICH(df[!, "open"], df[!, "high"], df[!, "low" ], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlsticksandwich" => ind)
end

# integer = CDLTAKURI(open, high, low, close)
function CDLTAKURI(df)
    ind = talib.CDLTAKURI(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdltakuri" => ind)
end

# integer = CDLTASUKIGAP(open, high, low, close)
function CDLTASUKIGAP(df)
    ind = talib.CDLTASUKIGAP(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdltasukigap" => ind)
end

# integer = CDLTHRUSTING(open, high, low, close)
function CDLTHRUSTING(df)
    ind = talib.CDLTHRUSTING(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlthrusting" => ind)
end

# integer = CDLTRISTAR(open, high, low, close)
function CDLTRISTAR(df)
    ind = talib.CDLTRISTAR(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdltristar" => ind)
end

# integer = CDLUNIQUE3RIVER(open, high, low, close)
function CDLUNIQUE3RIVER(df)
    ind = talib.CDLUNIQUE3RIVER(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlunique3river" => ind)
end

# integer = CDLUPSIDEGAP2CROWS(open, high, low, close)
function CDLUPSIDEGAP2CROWS(df)
    ind = talib.CDLUPSIDEGAP2CROWS(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlupsidegap2crows" => ind)
end

# integer = CDLXSIDEGAP3METHODS(open, high, low, close)
function CDLXSIDEGAP3METHODS(df)
    ind = talib.CDLXSIDEGAP3METHODS(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "cdlxsidegap3methods" => ind)
end