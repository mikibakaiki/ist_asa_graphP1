# Gerador de testes e respectivo gráfico


## Instruções

1. Extrai o conteudo do zip para uma pasta onde quiseres
2. Certifica-te que, para a pasta onde extraires o .zip, tens lá o teu projecto compilado e pronto para executar
3. Executa o comando `./generate_tests.sh` (pode demorar)
4. Depois, executa `./test.sh ./<nome do executavel do teu projecto> |tee results.data`
5. Em seguida, vais precisar de usar o gnuplot. Para fazeres download, caso nao tenhas, executa `sudo apt-get install gnuplot-x11`
6. Agora, executa `gnuplot` e quando o programa abrir, executa `plot "results.data"`
7. Podes guardar a imagem que vai aparecer como .png ou .pdf
8. Para saires do gnuplot, faz `quit`


## Algumas notas

1. Os vertices sao gerados de 1000 em 1000 e vao ate 100000. Podem alterar isto no ciclo for.
2. Todo o processo de geração de testes pode demorar... sejam pacientes.
3. Confirmem que os testes estão correctos com o nome do ficheiro. :)
4. Para ordenarem os resultados: `sort -n +0 -1 results.data > <novoficheiro>.data`
5. Se quiseres alterar o eixo xx, no `generate_tests_sh`, na linha `mv temp.in $FILES/$v` altera o `$v` para o que quiseres, de acordo com:
- `$v` = Número de vértices;
- `$vert` = Número aproximado de vértices+edges;
- `$scc` = Número de SCC especificado.

6. Para usar linhas no grafico para regressão linear:
  * `f(x) = a*x + b`
  * `fit f(x) '<nomedovossoficheiro>.data' u 1:2 via a, b`
  * `title_f(a,b) = sprintf('f(x) = %.2fx + %.2f', a, b)`
  * `plot '<nomedovossoficheiro>.data' f(x) t title_f(a,b)`

7. Para fazer com que o grafico seja exportado como png:
  * `set terminal png size 640,360 enhanced font "Helvetica,10"`
  * `set output "output.png"`




Qualquer erro, sugestão ou melhoria, digam-me :)



**_Disclaimer:_** Utilizem o gerador a vosso próprio risco. Baseado em trabalho de outros colegas de anos anteriores. Créditos deles, e um obrigado.
