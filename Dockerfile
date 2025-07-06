# Use uma imagem base oficial do Python.
# Usar a versão alpine mantém a imagem final menor.
FROM python:3.10.18-alpine3.22

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta que a aplicação irá rodar
EXPOSE 8000

# Comando para executar a aplicação quando o container iniciar
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000","--reload"]
