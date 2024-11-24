### Cycle Indicator Functions ###
# real = HT_DCPERIOD(close)
function HT_DCPERIOD(df; column="close")
    ind = talib.HT_DCPERIOD(df[!, column])
    insertcols!(df, length(propertynames(df)) + 1, "ht_dcperiod" => ind)
end

# real = HT_DCPHASE(close)
function HT_DCPHASE(df; column="close")
    ind = talib.HT_DCPHASE(df[!, column])
    insertcols!(df, length(propertynames(df)) + 1, "ht_dcphase" => ind)
end

# inphase, quadrature = HT_PHASOR(close)
function HT_PHASOR(df; column="close")
    inphase, quadrature = talib.HT_PHASOR(df[!, column])
    insertcols!(df, length(propertynames(df)) + 1, "ht_phasor-inphase" => inphase)
    insertcols!(df, length(propertynames(df)) + 1, "ht_phasor-quadrature" => quadrature)
end

# sine, leadsine = HT_SINE(close)
function HT_SINE(df; column="close")
    sine, leadsine = talib.HT_SINE(df[!, column])
    insertcols!(df, length(propertynames(df)) + 1, "ht_sine" => sine)
    insertcols!(df, length(propertynames(df)) + 1, "ht_sine-leadsine" => leadsine)
end

# integer = HT_TRENDMODE(close)
function HT_TRENDMODE(df; column="close")
    ind = talib.HT_TRENDMODE(df[!, column])
    insertcols!(df, length(propertynames(df)) + 1, "ht_trendmode" => ind)
end

# Calculate cycle indicators using cosine waves shifted to [1, 0, 1]
function cycleIndicator(unixTime::Int64, cyclePeriod::Int64)
    x = unixTime % cyclePeriod
    f = 2π / cyclePeriod
    return (0.5 * cos(x*f)) + 0.5
end

# Calculate cycle indicators for the DataFrame
function TIME_CYCLES(df::DataFrame)
    hourCycle = cycleIndicator.(df.time, UNIXHOUR)
    dayCycle = cycleIndicator.(df.time, UNIXDAY)
    weekCycle = cycleIndicator.(df.time, UNIXDAY * 7)
    yearCycle = cycleIndicator.(df.time, UNIXDAY * 365)
    insertcols!(df, length(propertynames(df)) + 1, "hour_cycle" => hourCycle)
    insertcols!(df, length(propertynames(df)) + 1, "day_cycle" => dayCycle)
    insertcols!(df, length(propertynames(df)) + 1, "week_cycle" => weekCycle)
    insertcols!(df, length(propertynames(df)) + 1, "year_cycle" => yearCycle)
end

function HOUR_CYCLE(df::DataFrame)
    hourCycle = cycleIndicator.(df.time, UNIXHOUR)
    insertcols!(df, length(propertynames(df)) + 1, "hour_cycle" => hourCycle)
end

function DAY_CYCLE(df::DataFrame)
    dayCycle = cycleIndicator.(df.time, UNIXDAY)
    insertcols!(df, length(propertynames(df)) + 1, "day_cycle" => dayCycle)
end

function WEEK_CYCLE(df::DataFrame)
    weekCycle = cycleIndicator.(df.time, UNIXDAY * 7)
    insertcols!(df, length(propertynames(df)) + 1, "week_cycle" => weekCycle)
end

function YEAR_CYCLE(df::DataFrame)
    yearCycle = cycleIndicator.(df.time, UNIXDAY * 365)
    insertcols!(df, length(propertynames(df)) + 1, "year_cycle" => yearCycle)
end
