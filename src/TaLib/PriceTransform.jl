### Price Transform Functions ###
# real = AVGPRICE(open, high, low, close)
function AVGPRICE(df)
    ind = talib.AVGPRICE(df[!, "open"], df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "avgprice" => ind)
end

# real = MEDPRICE(high, low)
function MEDPRICE(df)
    ind = talib.MEDPRICE(df[!, "high"], df[!, "low"])
    insertcols!(df, length(propertynames(df)) + 1, "medprice" => ind)
end

# real = TYPPRICE(high, low, close)
function TYPPRICE(df)
    ind = talib.TYPPRICE(df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "typprice" => ind)
end

# real = WCLPRICE(high, low, close)
function WCLPRICE(df)
    ind = talib.WCLPRICE(df[!, "high"], df[!, "low"], df[!, "close"])
    insertcols!(df, length(propertynames(df)) + 1, "wclprice" => ind)
end