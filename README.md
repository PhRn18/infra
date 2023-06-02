Infraestrutura com 4 Subnets, Registro no Route 53 e Instância de Banco de Dados
Este repositório contém um código de infraestrutura que provisiona uma arquitetura básica na nuvem da AWS. A infraestrutura consiste em:

2 subnets públicas: Essas subnets estão associadas a uma tabela de roteamento pública e podem ser usadas para acomodar instâncias ou serviços que precisam ser acessíveis diretamente pela internet.

2 subnets privadas: Essas subnets estão associadas a uma tabela de roteamento privada e são destinadas a instâncias ou serviços que não precisam ser acessíveis diretamente pela internet. Neste caso, uma instância de banco de dados será provisionada nessas subnets.

Registro no Route 53 (DNS interno): Um registro será criado na zona hospedada do Route 53 para permitir que os recursos dentro da VPC se refiram à instância de banco de dados pelo nome de domínio configurado.

Instância de Banco de Dados: Uma instância de banco de dados será provisionada nas subnets privadas para fornecer armazenamento e gerenciamento de dados para aplicativos.

Load Balancer: Um load balancer será provisionado para distribuir o tráfego de entrada entre várias instâncias de aplicativos para garantir a alta disponibilidade e escalabilidade.
