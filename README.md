**IAA004 - Linguagem R**

Alunos: ***Matheus Falconde*** e ***Victor Josviak***

# Implementações realizadas

Foi implementado três algoritmos para a predição do dataset ``Satellite`` da biblioteca ``mlbench``, que são:
* ***Random Forest***;
* ***SVM*** (Support Vector Machine)
* ***RNA*** (Artificial Neural Network)

Com base nos resultado obtidos com a execução dos algoritmos, foi constatado que o ```SVM``` teve a maior acurácia entre os três algoritmos.

##### Resultados Random Forest

|Accuracy | 0.8497 |
|---------|------|
| **95% CI** | (0.829, 0.8688)  |
| **No Information Rate** | 0.2383   |
| **P-Value [Acc> NIR]** | < 2.2e-16   |
| **Kappa** | 0.8137   |

##### Resultados RNA

|Accuracy | 0.8092 |
|---------|------|
| **95% CI** | (0.7866, 0.8303)  |
| **No Information Rate** | 0.2383   |
| **P-Value [Acc> NIR]** | < 2.2e-16   |
| **Kappa** | 0.7616   |

##### Resultados SVM

|Accuracy | 0.8707 |
|---------|------|
| **95% CI** | (0.8511, 0.8886)  |
| **No Information Rate** | 0.2383   |
| **P-Value [Acc> NIR]** | < 2.2e-16   |
| **Kappa** | 0.8399   |

> Como podemos observar nos resultados acima, o algoritmo SVM se comportou melhor na predição em relação aos outros dois utilizados.

Todos os comandos rodados para a execução estão disponíveis no arquivo ``script.R``

Os modelos ``(.rds)`` salvos estão dividos em cada pasta com os nomes dos algoritmos.