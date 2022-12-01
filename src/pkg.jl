import Pkg
Pkg.activate(".")
if !haskey(Pkg.installed(), "StatsPlots")
    Pkg.instantiate()
end

