FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho.
# Isso aproveita o cache de camadas do Docker. A instalação das dependências
# só será executada novamente se o arquivo requirements.txt for alterado.
COPY requirements.txt .

# Instala as dependências, --no-cache-dir ajuda a manter a imagem menor
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação
COPY . .

# Expõe a porta em que a aplicação irá rodar
EXPOSE 8000

# Comando para iniciar a aplicação quando o contêiner for executado
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
