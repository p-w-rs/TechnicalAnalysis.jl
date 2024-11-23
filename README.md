# TechI.jl

TechI.jl is a Julia package for technical analysis indicators including price transforms, moving averages, and oscillators.

## Installation

```julia
using Pkg
Pkg.add("TechI")
```

## Usage

```julia
using TechI

# Calculate Simple Moving Average
sma_values = SMA(price_data, 20)

# Calculate RSI
rsi_values = RSI(price_data, 14)

# Calculate MACD
macd_line, signal_line, histogram = MACD(price_data, 12, 26, 9)

# Calculate Bollinger Bands
upper_band, middle_band, lower_band = BBANDS(price_data, 20, 2.0)
```

## Features

### Price Transforms
- **Typical Price (TP)**: Average of high, low, and close prices
- **Median Price (MP)**: Average of high and low prices
- **Weighted Close Price (WCP)**: Weighted average with double emphasis on close price
- **OHLC Average**: Simple average of open, high, low, and close prices
- **Volume Weighted Average Price (VWAP)**: Price weighted by volume
- **Standard Deviation (SD)**: Price volatility measure
- **Average True Range (ATR)**: Volatility indicator based on price ranges

### Moving Averages
- **Simple Moving Average (SMA)**: Basic arithmetic mean
- **Smoothed Moving Average (SMMA)**: Smoothed version of SMA
- **Exponential Moving Average (EMA)**: Weighted average with more emphasis on recent prices
- **Weighted Moving Average (WMA)**: Linear weighted average
- **Hull Moving Average (HMA)**: Responsive moving average that reduces lag
- **Kaufman's Adaptive Moving Average (KAMA)**: Adapts to market volatility
- **Arnaud Legoux Moving Average (ALMA)**: Gaussian weighted moving average
- **Linear Weighted Moving Average (LWMA)**: Alternative weighted average
- **Triangular Moving Average (TRIMA)**: Double-smoothed moving average
- **Fibonacci Moving Average (FMA)**: Moving average weighted by Fibonacci sequence

### Oscillators
- **Relative Strength Index (RSI)**: Momentum indicator measuring speed and magnitude of price changes
- **Stochastic Oscillator (STOCH)**: Compares closing price to price range
- **MACD**: Trend-following momentum indicator
- **Commodity Channel Index (CCI)**: Measures current price level relative to average price
- **Average Directional Index (ADX)**: Trend strength indicator
- **Bollinger Bands (BBANDS)**: Volatility-based envelope indicator
- **Money Flow Index (MFI)**: Volume-weighted RSI
- **Chaikin Oscillator**: Momentum indicator based on accumulation-distribution
- **KDJ**: Modified stochastic oscillator
- **Ichimoku Cloud**: Multiple component trend indicator
- **Williams %R**: Momentum indicator showing overbought/oversold levels
- **Ultimate Oscillator**: Multi-timeframe momentum indicator

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.