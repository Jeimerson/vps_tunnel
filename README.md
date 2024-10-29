---

# SSH Tunnel Script

## Descrição (Português) 🇧🇷

Este script Bash cria um túnel SSH para comunicação segura entre duas VPS, facilitando o acesso a serviços específicos. No exemplo fornecido, ele está configurado para criar um túnel para o Redis, mas pode ser usado para qualquer outro serviço entre VPSs, como bancos de dados, serviços web, entre outros.

### Requisitos
- **Servidor SSH configurado com `GatewayPorts yes`**: Esta configuração é necessária no servidor de destino (`/etc/ssh/sshd_config`) para habilitar o encaminhamento de portas.
- **Chave pública SSH enviada para o servidor de destino**: Isso é necessário para autenticação sem senha.

### Como Usar
1. **Clonar o Repositório**:
   ```bash
   git clone https://github.com/Jeimerson/vps_tunnel.git
   cd vps_tunnel
   ```

2. **Configurar o Script**:
   Edite o arquivo `redis.sh` e defina as variáveis `SSH_HOST` e `SSH_PORT` com o IP e a porta do servidor SSH de destino.

3. **Executar o Script**:
   ```bash
   ./redis.sh
   ```

   Este script cria um túnel SSH entre seu sistema e o servidor de destino, redirecionando a porta `6379` (exemplo do Redis) para o mesmo endereço no servidor. Se você quiser usar outra porta ou outro serviço, basta ajustar as portas no comando `ssh -N -L`.

### Log e Lock
- **Log**: As mensagens do script são gravadas em `/var/log/ssh_tunnel.log`.
- **Lock**: Um arquivo de lock (`/tmp/ssh_tunnel.lock`) previne múltiplas instâncias simultâneas do script.

### Política de Responsabilidade
O uso deste script é de total responsabilidade do usuário. O autor não assume nenhuma responsabilidade por eventuais danos, perda de dados ou qualquer outro problema decorrente do uso do script.

---

## Description (English) 🇺🇸

This Bash script creates an SSH tunnel to securely connect two VPSs, allowing access to specific services. In the example provided, it is configured to create a tunnel for Redis, but it can be used for any other service between VPSs, such as databases, web services, and more.

### Requirements
- **SSH Server configured with `GatewayPorts yes`**: This configuration is necessary on the target server (`/etc/ssh/sshd_config`) to enable port forwarding.
- **Public SSH key sent to the target server**: This is necessary for passwordless authentication.

### Usage
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Jeimerson/vps_tunnel.git
   cd vps_tunnel
   ```

2. **Configure the Script**:
   Edit the `redis.sh` file and set the `SSH_HOST` and `SSH_PORT` variables with the IP and port of the target SSH server.

3. **Run the Script**:
   ```bash
   ./redis.sh
   ```

   This script creates an SSH tunnel between your system and the target server, forwarding port `6379` (example for Redis) to the same address on the server. If you want to use another port or service, simply adjust the ports in the `ssh -N -L` command.

### Log and Lock
- **Log**: Script messages are recorded in `/var/log/ssh_tunnel.log`.
- **Lock**: A lock file (`/tmp/ssh_tunnel.lock`) prevents simultaneous instances of the script.

### Responsibility Disclaimer
Use of this script is entirely at the user’s own risk. The author assumes no responsibility for any damage, data loss, or any other issues arising from the use of the script.
