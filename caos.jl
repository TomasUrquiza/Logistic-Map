using Plots
theme(:dark)


R = 2.9:0.0005:4.0   
x = 0.5              


r_vals = Float64[]
x_vals = Float64[]


for r in R
    global x
    
    for _ in 1:1000
        x = r * x * (1 - x)
    end
    
    
    for _ in 1:200
        x = r * x * (1 - x)
        push!(r_vals, r)
        push!(x_vals, x)
    end
end


scatter(r_vals, x_vals, 
        markersize = 0.5, 
        markeralpha = 0.1, 
        legend = false, 
        color = :cyan, 
        title = "Diagrama de Bifurcación (Mapa Logístico)",
        xlabel = "Tasa de crecimiento (r)",
        ylabel = "Población (x)")

p = scatter(r_vals, x_vals, 
        markersize = 0.5, 
        markeralpha = 0.1, 
        legend = false, 
        color = :cyan, 
        title = "Diagrama de Bifurcación (Mapa Logístico)",
        xlabel = "Tasa de crecimiento (r)",
        ylabel = "Población (x)")

savefig(p, "bifurcacion.png")
println("¡Gráfico generado! Revisa la carpeta ChaosJulia.")