# Win-Smart-Maintenance 🚀

Script de automação profissional para manutenção, reparo e atualização do ecossistema Windows. Este projeto foi desenvolvido com foco em eficiência, integridade de sistema e experiência do usuário (UX).

## 🧠 Linha de Pensamento e Arquitetura

O desenvolvimento deste script seguiu uma lógica de **Engenharia de Sistemas**, dividida em camadas de execução para garantir que o computador não apenas seja atualizado, mas também reparado e limpo de forma segura.

### 1. Camada de Segurança e Pré-requisitos
Antes de qualquer ação, o script valida o ambiente:
* **Token de Administrador**: Verifica se possui privilégios de alto nível. Sem isso, ferramentas como SFC e DISM falhariam silenciosamente.
* **Validação de Conectividade**: Um check de rede (ping) é realizado para evitar falhas de timeout em repositórios remotos.
* **Codificação UTF-8 (CHCP 65001)**: Garante a renderização correta de caracteres especiais e acentuação no terminal.

### 2. Camada de Aplicação (User Space)
Utiliza o **Windows Package Manager (Winget)** para gerenciar o ciclo de vida de softwares de terceiros. 
* **Automação Silent**: Os parâmetros `--silent` e `--accept-package-agreements` removem a necessidade de intervenção humana, permitindo uma manutenção fluida.

### 3. Camada de Sistema e Drivers (Kernel/OS)
Interage com o **Update Session Orchestrator (USO)** através do `UsoClient`. 
* Diferente da interface gráfica, aqui forçamos o trigger de busca de drivers e patches de segurança que muitas vezes ficam represados na fila de agendamento do Windows.

### 4. Camada de Integridade (Deep Repair)
Aqui entra a "fundação" do Windows:
* **DISM (Deployment Image Servicing and Management)**: Repara a imagem base do sistema comparando-a com os arquivos oficiais da Microsoft.
* **SFC (System File Checker)**: Verifica a integridade de todos os arquivos protegidos do sistema, substituindo versões corrompidas.

### 5. Camada de Higiene e UX
* **Limpeza Recursiva**: Diferente de um `del` comum, o script percorre pastas temporárias e remove artefatos de instaladores e caches.
* **Prova Social**: O script encerra abrindo a GUI do Windows Update, permitindo que o usuário valide visualmente que o sistema está em conformidade.

## 🛠️ Tecnologias e Ferramentas
* **Batch Scripting**: Orquestrador principal.
* **PowerShell**: Injetado para acesso a objetos COM do Windows Update.
* **Winget**: Gestor de pacotes.
* **DISM & SFC**: Ferramentas nativas de integridade de kernel.

## 🚀 Como Executar
1. Clone este repositório ou baixe o arquivo `.bat`.
2. Clique com o botão direito no arquivo `atualização_inteligente.bat`.
3. Selecione **Executar como Administrador**.

## 📝 Autor
**Lucas Lopes Moreira**
