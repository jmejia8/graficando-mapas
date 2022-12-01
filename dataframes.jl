include("src/pkg.jl")
using StatsPlots, GeoJSON, DataFrames
include("src/choropleth.jl")



function main()
    @info "Iniciando..."
    archivo_json = "data/veracruz.json"

    # lectura de archivo json
    json = GeoJSON.read(read(archivo_json))
    # convierte json en dataframe
    df = DataFrame(json)

    display(df)

    # selecciona colores apropiados
    colores = palette([:pink, :red, :black], 10)

    @info "Graficando..."
    # genera gráfico
    p = choropleth(df, :geometry, by = :Area, fill = colores, axis=false)
    # guarda gráfico
    savefig(p, "mapa.pdf")
    p
end

main()
