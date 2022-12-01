include("src/pkg.jl")
using StatsPlots, Shapefile

function main()
    shp = Shapefile.shapes(Shapefile.Table("data/mexico_estados.shp"))

    p = plot(title = "México")

    colores = colormap("Reds", 5)

    for estado in shp
        plot!(estado, fill=rand(colores))
    end
    p
end

main()
