module TechI

using StatsBase

# Price Transforms
export TP, MP, WCP, OHLC, VWAP, SD, ATR

# Moving Averages
export SMA, SMMA, EMA, WMA, HMA, KAMA, ALMA, LWMA, VWAP, TRIMA, FMA

# Oscillators
export RSI, STOCH, MACD, CCI, ADX, BBANDS, MFI, CHAIKIN, KDJ, ICHIMOKU, WILLR, ULTOSC

include("TI/PriceTransforms.jl")
include("TI/MovingAverages.jl")
include("TI/Oscillators.jl")

end # module TechI
