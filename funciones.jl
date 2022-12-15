using DataFrames
using CSV
using Graphs
using GraphPlot
using Distances
using Colors
using Plots
using LaTeXStrings
plotlyjs()

function distanciasCortas(g)
    N = nv(g)  
    MatD0 =  zeros(N,N)
    for i in 1:N
        dist = dijkstra_shortest_paths(g,i).dists        
        for j in 1:N
            MatD0[j,i] = dist[j]
        end
    end
    dmin = minimum(MatD0)
    dmax = maximum(MatD0)
    return dmin,dmax,MatD0
end

function distanciaPromedioMasCorta(g)
    n = nv(g)
    dist = distanciasCortas(g)[3]
    sum = zeros(n)
    d = 0
    for i in 1:n
        for j in 1:n
            sum[i] += dist[i,j]
        end
        d += sum[i]
    end
    d = d/(n*(n-1))
    return d
end

function distanciasEnlaces(coordenadas,m)
    N = 629
    M = zeros(N,N)

    for i in 1:N
        for j in 1:N
            x1, y1 = coordenadas[i,1], coordenadas[i,2]
            x2, y2 = coordenadas[j,1], coordenadas[j,2]
            M[i,j] = sqrt((x2-x1)^2+(y2-y1)^2)
        end
    end
    
    M = M .< m/111111
    for i in 1:629
        M[i,i] = 0
    end
    return M
end

function contador(lista,int)
    c = []
    for i in 1:length(lista)
        if lista[i] == int
            push!(c,lista[i])
        end
    end
    return length(c)
end

function centriBe(g)
    c_be = betweenness_centrality(g)
    n = length(degree(g))
    for i in 1:n
        if c_be[i] < 5E-3
            c_be[i] = 1
        elseif  c_be[i] > 5E-3 && c_be[i] <= 5E-2
            c_be[i] = 2
        elseif c_be[i] > 5E-2 && c_be[i] <= 1
            c_be[i] = 3         
        end
    end
    return c_be = Int.(c_be )
end

function centriEig(g)
    c_ei = eigenvector_centrality(g)
    n = length(degree(g))
    for i in 1:n
        if c_ei[i] < 1E-8
            c_ei[i] = 1
        elseif  c_ei[i] > 1E-8 && c_ei[i] <= 0.08551275437111235
            c_ei[i] = 2
        elseif c_ei[i] > 0.08551275437111235 && c_ei[i] <= 1
            c_ei[i] = 3
        end
    end
    return c_ei = Int.(c_ei )
end

function centralidadBTEI(c_ei,c_bei,g,kwargs...)
    nodecolor = [colorant"lightseagreen", colorant"magenta",  colorant"lime"]
    nodefillc = nodecolor[c_be]
    nodesize = c_ei
    return gplot(g,kwargs...,
    nodefillc=nodefillc,
    nodesize=nodesize)
end

function iMaxComp(g)
    for i in 1:629
        if length.(g.fadjlist)[i] == maximum(length.(g.fadjlist))
            return i
        end
    end
end

function transparenciaSR(g,arr)
    sol = zeros(629)
    for i in 1:629
        if arr[1] ∈ g.fadjlist[i] || 
            arr[2] in g.fadjlist[i] ||  
            arr[3] in g.fadjlist[i] || 
            arr[4] in g.fadjlist[i] || 
            arr[5] in g.fadjlist[i] ||
            arr[6] in g.fadjlist[i] ||
            arr[7] in g.fadjlist[i] ||
            arr[8] in g.fadjlist[i] ||
            arr[9] in g.fadjlist[i] ||
            arr[10] in g.fadjlist[i] ||
            arr[11] in g.fadjlist[i] ||
            arr[12] in g.fadjlist[i] ||
            arr[13] in g.fadjlist[i] 
            sol[i] = 1
        else
            sol[i] = 0.15
        end
    end
    return sol 
end    

function buscadorSR(g,j)
    for i in 1:629
        if j ∈ g.fadjlist[i]
            return i
        end
    end
end

"""Esta función es un prototipo, no funciona de forma universal
solamente devuelve la subred que considera los nodos [1,34,35,209,210,64]
y sus respectivas interconexiones."""
function subRed(g)
    G = Graph(629)
    srs = [(g.fadjlist)[i] for i in [1,35,209,34,210,64,21,44,70,6,7,8,5]]
    for i in 1:length(srs)
        for j in 1:length(srs[i])
            for k in 1:length(g.fadjlist[srs[i][j]])
                add_edge!(G,srs[i][j],g.fadjlist[srs[i][j]][k])
            end
        end
    end
    return G
end

function SubcentriBe(g)
    c_be = betweenness_centrality(g)
    n = length(degree(g))
    for i in 1:n
        if c_be[i] == 0 
            c_be[i] = 1
        elseif  c_be[i] > 0 && c_be[i] <= 8E-4
            c_be[i] = 2
        elseif c_be[i] > 8E-4 && c_be[i] <= 4E-3
            c_be[i] = 3         
        elseif c_be[i] > 4E-3 && c_be[i] < 1
            c_be[i] = 4         
        end
    end
    return c_be = Int.(c_be )
end

function SubcentriEig(g)
    c_ei = eigenvector_centrality(g)
    n = length(degree(g))
    for i in 1:n
        if c_ei[i] < 1E-8
            c_ei[i] = 1
        elseif  c_ei[i] > 1E-8 && c_ei[i] <= 0.08551275437111235
            c_ei[i] = 2
        elseif c_ei[i] > 0.08551275437111235 && c_ei[i] <= 1
            c_ei[i] = 3
        end
    end
    return c_ei = Int.(c_ei)
end

function enlacesAleatorios(N,p)
    Channel() do channel
        for i in 1:N
            for j in 1:i
                if rand() < p
                    put!(channel,(i,j))
                end
            end
        end
    end
end

function redAleatoria(N,p)
    g = Graph(N)
    enlaces = collect(enlacesAleatorios(N,p))
    for i in 1:length(enlaces)
        add_edge!(g,enlaces[i][1],enlaces[i][2])
    end
    return g
end

datos = DataFrame(CSV.File("Establecimientoseconomicos.csv"))
coordenadas = datos[!,[5,6]]

function tranFase()
    d = range(0, stop=300, step=10)
    sol = zeros(length(d))
    
    for j in 1:length(d)
        M = distanciasEnlaces(coordenadas,d[j])
        g = Graph(M)
        sol[j] = maximum(length.(connected_components(g)))
    end
    return d,sol
end