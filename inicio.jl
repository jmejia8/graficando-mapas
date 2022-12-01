include("src/pkg.jl")
using StatsPlots, Shapefile

function main()
    shp = Shapefile.shapes(Shapefile.Table("data/mexico_estados.shp"))
    plot(shp)
end

main()
