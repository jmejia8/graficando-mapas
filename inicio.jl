using StatsPlots, Shapefile

function main()
    shp = Shapefile.shapes(Shapefile.Table("mexico_estados.shp"))
    plot(shp)
end

main()
