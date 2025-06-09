# Infraestrutura como Código com Terraform

## O que é Terraform?

Terraform é uma ferramenta de **Infraestrutura como Código (IaC)** que permite gerenciar recursos de infraestrutura em provedores de nuvem, no caso dessa ponderada trabalharemos com AWS.

## Estrutura do Projeto

Para adicionar um contexto a atividade, foi decidido utilizar o Terraform para criar e configurar um site estático hospedado no **Amazon S3**.

### 1. Configuração das Variáveis de Ambiente

No arquivo `variables.tf` foram definidas as variáveis necessárias para autenticar e configurar o Terraform na AWS:

- **`access_key`**: Chave de acesso da AWS.
- **`secret_key`**: Chave secreta da AWS.
- **`session_token`**: Token de sessão temporário.
- **`region`**: Região onde os recursos serão criados.

### 2. Configuração Principal

O arquivo `main.tf` contém a configuração principal do Terraform. Como o objetivo é criar um site estático, o código precisou criar um bucket S3 e configurar as permissões necessárias para que o site seja acessível publicamente. O nome do bucket foi definido como `bucket-site-da-paulinha`, e o arquivo `index.html` é enviado automaticamente para o bucket.

### 3. Configuração de Outputs

No arquivo `outputs.tf`, foi configurada a saída do Terraform para exibir a URL do site estático hospedado no S3.

```hcl
output "website_url" {
  value = aws_s3_bucket.site_bucket.website_endpoint
}
```

### 4. Resultados
Antes de executar o Terraform, o bucket S3 não existia e não havia nenhum site hospedado. 

<div align="center">
    <sub>Antes da execução do Terraform</sub><br>
        <img src="/assets/no_buckets.png" alt="Antes da execução do Terraform" width="600">
</div>

Ao executar o Terraform, um bucket S3 é configurado para hospedar um site estático, com uma política de acesso público que permite que qualquer pessoa acesse o site. O arquivo `index.html` é enviado automaticamente para o bucket, e a URL do site é exibida como saída no terminal. 

<div align="center">
    <sub>Após a execução do Terraform</sub><br>
        <img src="/assets/buckets.png" alt="Após a execução do Terraform" width="600">
</div>

Então, ao acessar a URL exibida, você pode visualizar o site estático hospedado no S3. O site é acessível publicamente, permitindo que qualquer pessoa visualize o conteúdo hospedado. Esse é um exemplo simples de como o Terraform pode ser usado para gerenciar a infraestrutura na AWS, facilitando a criação e configuração de ambientes de nuvem.

<div align="center">
  <sub>Site acessado pela url recebida</sub><br>
  <img src="/assets/site.png" width="100%" 
  alt="Site">
</div>

## Como Executar o Projeto
1. Instale o Terraform: Certifique-se de que o Terraform está instalado em sua máquina e preste atenção ao sistema operacional utilizado, pois a instalação pode variar entre Windows, Linux e MacOS. Você pode encontrar as instruções de instalação no site oficial do Terraform: [Instalação do Terraform](https://developer.hashicorp.com/terraform)

2. Clone o Repositório: Clone este repositório em sua máquina local

3. Configure as Variáveis: Preencha as variáveis no arquivo `variables.tf` com suas credenciais da AWS

4. Inicialize o Terraform 
   ```
   terraform init
   ```
5. Planeje a Infraestrutura 
   ```
   terraform plan
   ```
6. Aplique as Configurações 
   ```
   terraform apply
   ```
7. Acesse o Site: Após a execução, copie a URL exibida no terminal e acesse o site estático
