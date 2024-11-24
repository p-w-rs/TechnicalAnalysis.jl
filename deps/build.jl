using Conda
using PyCall

function install_talib()
    try
        pyimport("talib")
        @info "TA-Lib already installed"
    catch e
        @info "Installing TA-Lib via conda-forge..."
        try
            Conda.add("ta-lib"; channel="conda-forge")
            pyimport("talib")
            @info "TA-Lib installation completed"
        catch e
            @error "Failed to install TA-Lib: $e"
            rethrow(e)
        end
    end
end

install_talib()
