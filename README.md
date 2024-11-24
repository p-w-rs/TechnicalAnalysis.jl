# TechnicalAnalysis.jl

A Julia wrapper for TA-Lib (Technical Analysis Library) that provides a comprehensive collection of technical analysis indicators and pattern recognition tools.

## Features

- Comprehensive implementation of TA-Lib functions
- DataFrame-based interface
- Automatic column naming based on function parameters
- Support for all major technical analysis categories:
  - Overlap Studies (Moving Averages, Bollinger Bands, etc.)
  - Momentum Indicators (RSI, MACD, Stochastic, etc.)
  - Volume Indicators (OBV, etc.)
  - Volatility Indicators (ATR, etc.)
  - Price Transform (Average/Median Price, etc.)
  - Cycle Indicators (Hilbert Transform)
  - Pattern Recognition (Candlestick Patterns)
  - Statistic Functions (Linear Regression, Standard Deviation, etc.)

## Installation

```julia
using Pkg
Pkg.add("TechnicalAnalysis")
```

Note: This package requires TA-Lib to be installed on your system. Installation instructions for TA-Lib can be found [here](https://ta-lib.org/hdr_dw.html).

## Usage

```julia
using TechnicalAnalysis
using DataFrames

# Create or load your data
df = DataFrame(
    open = [...],
    high = [...],
    low = [...],
    close = [...],
    volume = [...]
)

# Calculate indicators
SMA(df, period=20)  # Simple Moving Average
RSI(df, period=14)  # Relative Strength Index
BBANDS(df, period=20)  # Bollinger Bands

# Results are added as new columns to the DataFrame (i.e. treat every function as a ! function)
```

## Available Functions

### Overlap Studies
- HMA (Hull Moving Average)
- BBANDS (Bollinger Bands)
- DEMA (Double Exponential Moving Average)
- EMA (Exponential Moving Average)
- MAMA (MESA Adaptive Moving Average)
- MAVP (Moving Average with Variable Period)
- And many more...

### Momentum Indicators
- ADX (Average Directional Movement Index)
- MACD (Moving Average Convergence/Divergence)
- RSI (Relative Strength Index)
- STOCH (Stochastic)
- And many more...

### Volume Indicators
- AD (Chaikin A/D Line)
- ADOSC (Chaikin A/D Oscillator)
- OBV (On Balance Volume)

### Volatility Indicators
- ATR (Average True Range)
- NATR (Normalized Average True Range)
- TRANGE (True Range)

### Pattern Recognition
- Various candlestick patterns (Doji, Hammer, Engulfing, etc.)

### And More
- Price Transforms
- Cycle Indicators
- Statistical Functions

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
