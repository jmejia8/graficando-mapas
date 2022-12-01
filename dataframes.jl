using StatsPlots, GeoJSON, DataFrames
include("choropleth.jl")



function main()
    @info "Iniciando..."
    archivo_json = "veracruz.json"

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
    savefig(p, "mapa_"*archivo_json*".pdf")
    p
end

main()
