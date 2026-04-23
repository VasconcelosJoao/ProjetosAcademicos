# Trabalho 2 - 2024/2

Trabalho 2 da disciplina de Fundamentos de Sistemas Embarcados (2024/2)

## Alunos
| Matrícula | Aluno |
|-----------|-------|
| 190089601 | João Lucas Pinto Vasconcelos |
| 211062259 | Mateus Orlando Medeiros Ribeiro |

## Objetivo

&emsp;&emsp;Este trabalho tem por objetivo aplicar os conceitos de sistemas embarcados a um sistema de controle automotivo. Serão explorados os conceitos de entradas e saídas digitais via GPIO, eventos, controle de interrupções, threads, PWM, comunicação UART via protocolo MODBUS bem como o uso do barramento I2C.

&emsp;&emsp;O trabalho envolve o desenvolvimento do software que efetua o controle de partes do sistema elétrico e acionamento do motor de um automóvel. O sistema deve ser capaz de movimentar o carro através do controle do acelerador e freio, medir a rotação do motor bem como a velocidade do carro, controlar o acionamento do sistema elétrico incluindo faróis e setas de direção bem como implementar o controle de velocidade (cruise control). O controle do carro deve responder aos comandos dos usuários por meio de botões do painel e dos pedais de aceleração e freio.

## Apresentação

&emsp;&emsp;Link do vídeo da apresentação: **[Inserir Link Aqui]**

## Estrutura do Projeto

```plaintext
fse/
├── include/              # Arquivos de cabeçalho (.h)
├── src/                  # Arquivos fonte (.c)
├── obj/                  # Arquivos objeto gerados durante a compilação
├── bin/                  # Diretório do executável final
├── Makefile              # Gerenciador de build
└── README.md             # Documentação
```

## Instruções de Compilação

### Pré-requisitos
- Certifique-se de ter os seguintes pacotes instalados no sistema:
   - `gcc` (compilador C);
   - `make`;
   - `libbcm2835` (biblioteca para manipulação de GPIO);
   - `wiringPi` (biblioteca para comunicação com hardware).

1. Acesso SSH - Entre no SSH da placa com o seguinte comando:
   ```bash
   ssh -p <porta referente a placa> <primeiro e ultimo nome juntos>@164.41.98.2
   ```

2. Clone o repositório do projeto:
   ```bash
   git clone <link-do-repositorio>
   cd fse
   ```

3. Compile o projeto utilizando o `Makefile`:
   ```bash
   make all
   ```

4. O executável final será gerado no diretório `bin/` com o nome `bin`.

## Instruções de Execução

1. Execute o programa:
   ```bash
   ./bin/bin
   ```

2. A saída do sistema será exibida no console, enquanto o display OLED apresentará informações sobre velocidade, RPM, temperatura do motor e outros dados relevantes. Além disso o dashboard, referente a placa que o projeto estiver rodando, estará funcional. 

## Uso do Sistema

- **Display OLED**: Mostra as informações monitoradas e calculadas pelo sistema.
- **Temperatura do Motor**: Lida pelo ADC da ESP32 e exibida no OLED.
- **Controle de Velocidade**: Utiliza o protocolo MODBUS para enviar e receber comandos.
- **Relatório do Sistema**: As informações também podem ser registradas no console para depuração.

## Relatório do Experimento

### Gráficos de Desempenho

Análise dos dados coletados durante a execução do sistema:

## Conclusões

Este trabalho permitiu consolidar os conceitos de sistemas embarcados aplicados em um sistema de controle automotivo, destacando a integração de múltiplas tecnologias e protocolos. Foi possível compreender o funcionamento de entradas e saídas digitais via GPIO, eventos, controle de interrupções, threads, PWM, comunicação UART via protocolo MODBUS e o uso do barramento I2C.A implementação mostrou-se robusta e responsiva, com todas as tarefas executadas em threads paralelas, garantindo eficiência no processamento de dados. A execução prática desses conceitos permitiu criar um sistema funcional e interativo.

## Referências

[Controle Liga/Desliga - Wikipedia](https://pt.wikipedia.org/wiki/Controle_liga-desliga)  
[Controle PID - Wikipedia](https://pt.wikipedia.org/wiki/Controlador_proporcional_integral_derivativo)  
[Driver da Bosh para o sensor BMP280](https://github.com/BoschSensortec/BMP2-Sensor-API/)  
[Biblioteca BCM2835 - GPIO](http://www.airspayce.com/mikem/bcm2835/)    
[Controle do OLED 128x64 C/C++](https://github.com/gavinlyonsrepo/SSD1306_OLED_RPI)  
[Biblioteca WiringPi GPIO](http://wiringpi.com)  
[PWM via WiringPi](https://www.electronicwings.com/raspberry-pi/raspberry-pi-pwm-generation-using-python-and-c) 


