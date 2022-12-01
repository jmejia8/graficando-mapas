function choropleth(df, geometria;
        by = nothing,
        fill = palette([:pink, :red, :black], 10),
        kargs...
    )
    if isnothing(by)
        @error "Select a valid column."
    end
    columna = by
    colores = fill

    max_area = maximum(df[:, columna])
    min_area = minimum(df[:, columna])

    micolor(area) = begin 
        v = (area - min_area) / (max_area - min_area)
        colores[1 + round(Int, (length(colores)-1)*v) ]
    end

    p = plot(;aspect_ratio=1, kargs...)
    for row in eachrow(df)
        plot!(row[geometria], la=0, fill=micolor(row[columna]))
    end
    p
end
