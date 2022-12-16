import pandas as pd
import networkx as nx
import numpy as np
import matplotlib.pyplot as plt
import random

archivo = '/home/rogve98/Documentos/C13(N)C1AS/Ciencia de Redes/Proyecto/Establecimientoseconomicos.csv'
datos = pd.read_csv(archivo,
            )
coordenadas = datos[['Latitud', 'Longitud']].values
N = len(coordenadas)
M = np.zeros([N, N])
for i in range(N):
    for j in range(N):
        x1,y1 = coordenadas[i]
        x2,y2 = coordenadas[j]
        M[i,j] = np.sqrt((x2-x1)**2 + (y2-y1)**2)
        
M=(M<175/111111)*1
for i in range(629):
    M[i,i] = 0    
G = nx.from_numpy_array(M)
    

def percolacion_red(G,f,ataque=False):
    num_nodos_a_remover = int(f * G.number_of_nodes())

    if(ataque):
        nodos = [nodo for nodo,grado in sorted(G.degree(),key=lambda item:item[1],reverse=True)]
        nodos_a_remover = nodos[0:num_nodos_a_remover]
    else:
        nodos = list(G.nodes)
        nodos_a_remover = random.sample(nodos,num_nodos_a_remover)

    G.remove_nodes_from(nodos_a_remover)
    tamanio_max_comp = len(max(nx.connected_components(G),key=len))

    return tamanio_max_comp

def experimento_percolacion_redes(f_valores,repeticiones,ataque,generar_red_callback,*args):
    # listas donde se guardaran los resultados 
    # de las simulaciones
    promedios_tamanio_max_comp = []

    for f in f_valores:
        resultados_repeticiones_tamanio_max_comp = []
        for repeticion in range(repeticiones):
            # se crea una red ejecutando el callback
            # y pasándole los argumentos que necesita
            G = generar_red_callback(*args) 
            tamanio_comp = percolacion_red(G,f,ataque)
            resultados_repeticiones_tamanio_max_comp.append(tamanio_comp)

        promedio_tamanio_max_comp = np.mean(resultados_repeticiones_tamanio_max_comp)
        promedios_tamanio_max_comp.append(promedio_tamanio_max_comp)

    return promedios_tamanio_max_comp

# parámetros de las redes
N = len(G) # nodos

# parámetros experimentos
f_valores = np.arange(0,1,step=0.02)
repeticiones = 30

# corremos los experimentos y los guardamos
resultado_VA_falla = experimento_percolacion_redes(f_valores,repeticiones,
                                                   False,nx.from_numpy_array,M)
resultado_VA_ataque = experimento_percolacion_redes(f_valores,repeticiones,
                                                   True,nx.from_numpy_array,M)


# graficamos los resultados
x = f_valores
y1 = np.array(resultado_VA_falla)/N
y2 = np.array(resultado_VA_ataque)/N

plt.figure(figsize=(7,7))

plt.plot(x,y1,'o',alpha=0.8,label='falla',color='#75AAFF')
plt.plot(x,y2,'r^',alpha=0.8,label='ataque',)#color='#75AAFF')
plt.title('Red de comercio en Valle de Aragón')
plt.ylabel('Tamaño relativo máxima componente')
plt.xlabel('Fracción de nodos removidos (f)')
plt.legend()
#plt.axvline(x=0.75,color="#CFCFCC",linestyle='--')
#plt.axvline(x=0.35,color="#CFCFCC",linestyle=':')

plt.show()